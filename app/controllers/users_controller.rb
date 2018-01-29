class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    #ExampleMailer.sample_email(User.first).deliver
    if params[:q].nil?
      @q = User.ransack(params[:q])
    else
      @q = User.ransack(email_matches: params[:q][:email],id_matches:params[:q][:id] )
    end
    @users = @q.result.paginate(:page => params[:page],per_page: 5)
  end

  def show
  end
  def new
    @direction = create_user_no_devise_path
    @user = User.new
  end

  def edit
    @direction = "/update_user_no_devise/#{@user.id}"
  end

  def create
    adjusted_params = pw_present(user_params)

    unless can? :create, Role.new
      adjusted_params[:role_ids] = [Role.where(name: Role::USER_ROLE_NAME).first.id]
    end

    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: t("user.successfully-created")
    else
      render :new
    end
  end

  def update

    if @user.update(pw_present(user_params))
      redirect_to @user, notice: t("user.successfully-updated")
    else
      render :edit
    end

  end

  def destroy
    redirect_location = ""
    notice = t("user.successfully-destroyed")
    if current_user.id == @user.id
      if @user.destroy
        redirect_location = new_user_session_url
      end
    elsif @user.destroy
      redirect_location = users_path
    else
      byebug
      redirect_location = root_path
      notice = "#{t("user.not-successfully-destroyed")} #{t("sys_admin")}"
    end
    redirect_to redirect_location, notice: notice
  end

  private

    def pw_present(old_params)
      new_params = {}
      if old_params[:password].blank? && old_params[:password_confirmation].blank?
        new_params = old_params.extract!(:id,
                                      :avatar,
                                      :first_name,
                                      :last_name,
                                      :city,
                                      :province,
                                      :email,
                                      :dob,
                                      :role_ids)
    end
      new_params
    end

    def set_user
      @user = User.find(params[:id])
      session[:user_id] = @user.id
    end

    def user_params
      params.require(:user).permit( :id,
                                    :avatar,
                                    :first_name,
                                    :last_name,
                                    :password,
                                    :password_confirmation,
                                    :city,
                                    :province,
                                    :dob,
                                    :email,
                                    role_ids:[],
                                  )
    end
end
