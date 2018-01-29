require 'rails_helper'
require 'spec_helper'

RSpec.describe PostsController, type: :controller do

  let(:user_role){ FactoryGirl.create(:role,{name:'user'})}

  let!(:user){FactoryGirl.create(:user,role_ids:[user_role.id])}

  before(:each){
    @admin = User.new
    @admin.password ='123456'
    @admin.email = "testadmin@test.com"
    @admin.save!
    @admin_role_id = Role.find_by_name(Role::ADMIN_ROLE_NAME).id
    @admin.assignments.create(role_id: @admin_role_id)
    @admin.save!
    sign_in @admin
   }

  let(:valid_attributes) {
    {
      title:"test title",
      price: "5.00",
      content: "test content",
      user_id: user.id,
      image_attributes:{photo: fixture_file_upload('/binaries/dog_1.jpg','image/jpg', "true")}
    }
  }

  let(:invalid_attributes) {
    {
      title: "",
      price: "potato",
      content: "test content",
      image_attributes:{}
    }
  }

  describe "GET #index" do
    it "assigns all posts as @posts" do
      post = Post.create! valid_attributes
      get :index
      expect(post).to be_valid
      expect(assigns(:posts)).to eq([post])
    end
    it "renders the index template" do
      post = Post.create! valid_attributes
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :show, params: {id: post.id}
      expect(assigns(:post)).to eq(post)
    end
    it "renders the show template" do
      post = Post.create! valid_attributes
      get :show, params: {id: post.id}
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assigns a new post as @post" do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :edit, params: {id: post.to_param}
      expect(assigns(:post)).to eq(post)
    end
    it "renders the edit template" do
      post = Post.create! valid_attributes
      get :edit, params: {id: post.to_param}
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new post in the database" do
        expect { post :create, params: {post: valid_attributes} }.to change(Post, :count).by(1)
      end
      it "redirects to posts#show" do
        post :create, params: {post: valid_attributes}
        expect(response).to redirect_to(Post.last)
      end
      it "saves the new post image" do
        post :create, params: {post: valid_attributes}
        expect(assigns(:post).image).to be_valid
      end
      it "image type equals Post" do
        post :create, params: {post: valid_attributes}
        expect(assigns(:post).image.external_type).to eq("Post")
      end
      it "produces valid create flash message" do
        post :create, params: {post: valid_attributes}
        expect(assigns(:post).image.external_type).to eq("Post")
        expect(flash[:notice]).to match(I18n.t("post.successfully-created"))
      end

    end

    context "with invalid attributes" do
      it "does not save the new post in the database" do
        expect { post :create, params: {post: invalid_attributes}}.to change(Post, :count).by(0)
      end
      it "renders the :new template" do
        post :create, params: {post: invalid_attributes}
        expect(response).to render_template("new")
      end
      it "assigns 2 error message" do
        post :create, params: {post: invalid_attributes}
        expect(assigns(:post).errors.size).to eq(2)
      end
      it "returns error message title 'can\'t be blank'" do
        post :create, params: {post: invalid_attributes}
        expect(assigns(:post).errors.messages[:price]).to match([I18n.t("activerecord.errors.models.post.attributes.price.not_a_number")])
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      let(:update_valid_attributes) {
        {
          title:"edit test title",
          price: 4.00,
          content: "edit test content",
          image_attributes:{photo: fixture_file_upload('/binaries/dog_2.jpg','image/jpg', "true")}
        }
      }
      it "updates the requested post" do
        post_admin = Post.create(valid_attributes)
        put :update, params: {id: post_admin.id, post: update_valid_attributes}
        expect(assigns(:post)).to be_valid
      end
      it "redirects to the post" do
        post_admin = Post.create(valid_attributes)
        put :update, params: {id: post_admin.id, post: update_valid_attributes}
        expect(response).to redirect_to(post_url(post_admin.id))
      end
      it "produces valid update flash message" do
        post_admin = Post.create(valid_attributes)
        put :update, params: {id: post_admin.id, post: update_valid_attributes}
        expect(flash[:notice]).to match(I18n.t("post.successfully-updated"))
      end
    end

    context "with invalid attributes" do
      it "assigns the post as @post" do
        post_admin = Post.create(valid_attributes)
        put :update, params: {id: post_admin.id, post:  invalid_attributes}
        expect(assigns(:post)).to eq(post_admin)
      end
      it "returns error message 'can\'t be blank'" do
        post_admin = Post.create(valid_attributes)
        put :update, params: {id: post_admin.id, post:  invalid_attributes}
        expect(assigns(:post).errors.messages[:title]).to eq(["can't be blank"])
      end
      it "renders the edit template" do
        post_admin = Post.create(valid_attributes)
        put :update, params: {id: post_admin.id, post:  invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post_admin = Post.create(valid_attributes)
      expect { delete :destroy, params: {id: post_admin.id} }.to change(Post, :count).by(-1)
    end
    it "redirects to posts" do
      post_admin = Post.create(valid_attributes)
      delete :destroy, params: {id: post_admin.id}
      expect(response).to redirect_to(posts_url)
    end
    it "produces valid destroy flash message" do
      post_admin = Post.create(valid_attributes)
      delete :destroy, params: {id: post_admin.id}
      expect(flash[:notice]).to match(I18n.t("post.successfully-destroyed"))
    end

  end

end
