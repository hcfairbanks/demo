class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    helpers.hellowbetty("!!! it worked !!!")
    @posts = create_query
  end

  def show
    @comments = Comment.where(post_id: @post.id)
    @comment = Comment.new
    # Dir.foreach("#{Rails.root}/public/uploads/post/pics/1") do |item|
    #   next if item == '.' or item == '..'
    #   @test_a.push(item)
    # end
  end

  def new
    @post = Post.new
    @post.photos.build
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      ActionCable.server.broadcast 'room_channel',
                           content: @post.content,
                           title: @post.title
      #head :ok

      # More logic neede in here but not a bad start
      #redirect_to @post, notice: "#{t("post.successfully-created")}"
      redirect_to(request.env['HTTP_REFERER'])
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: t("post.successfully-updated")
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: t("post.successfully-destroyed")
    else
      redirect_to posts(@post), notice: "#{t("post.not-successfully-destrpyed")} #{t("sys_admin")}"
    end
  end

  private
  def create_query
    communities = current_user.communities.collect(&:id)
    friends = { posts:{ user_id: current_user.friendships.collect(&:friend_id) } }
    post = Post.joins(:multiposts).where( multiposts: { community_id: [communities]})
    post = search_options(post)
    friends_data = Post.joins(:multiposts).
                              where( multiposts: { community_id: Community::GLOBAL_COMMUNITY}).
                              where(friends)
    friends_data = search_options(friends_data)
    post = post.or(friends_data).group(:id)
    post = params[:order_by].blank? ? post.order("created_at DESC") : post.order(order_querry(params[:order_by].to_sym))
    #post = post.limit(100). # I dont think I should have this here
    post = post.paginate(page: params[:page], per_page: 10) # Should I have an option for this ?
  end

  def search_options(search_model)
    search_model = search_model.where( posts:{ price: params[:min_price]..params[:max_price]} ) if !params[:min_price].blank? && !params[:max_price].blank?
    search_model = search_model.where( posts:{ price: Post::MIN_PRICE..params[:max_price]} ) if params[:min_price].blank? && !params[:max_price].blank?
    search_model = search_model.where( posts:{ price: params[:min_price]..Post::MAX_PRICE} ) if !params[:min_price].blank? && params[:max_price].blank?

    end_date = DateTime.now
    start_date = Date.today - Post::MAX_DAYS_SEARCH.days
    if !params[:start_date].blank? && !params[:end_date].blank?
      start_date = params[:start_date].to_date
      end_date = params[:end_date].to_date
    elsif !params[:start_date].blank? && params[:end_date].blank?
      start_date = params[:start_date].to_date
    elsif params[:start_date].blank? && !params[:end_date].blank?
      end_date = params[:end_date].to_date
    end
    search_model = search_model.where( posts:{ created_at:  start_date..end_date} )
    search_model = search_model.where( "posts.content like :querry",querry: "%#{params[:content]}%" ) if !params[:content].blank?
    search_model = search_model.where( "posts.title like :querry",querry: "%#{params[:title]}%" ) if !params[:title].blank?
    search_model
  end

  def order_querry(order_by)
    # Not sure if this should be it's own function or not ?
    order_options = {
      latest: "created_at DESC",
      oldest: "created_at ASC",
      title: "title ASC",
      content: "content ASC",
      highest_price: "price DESC",
      lowest_price: "price ASC"
    }

    order_options[order_by]

  end




    def image_present(old_params)
      new_params = {}
      if old_params[:image_attributes].blank?
        new_params = post_params.extract!(:title,:price,:content,:user_id,:avatar)
      else
        new_params = old_params
      end
      new_params
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title,
                                    :price,
                                    :content,
                                    :avatar,
                                    #:photos,
                                    community_ids:[],
                                    photos_attributes:[:pic]
                                    )
    end
end
