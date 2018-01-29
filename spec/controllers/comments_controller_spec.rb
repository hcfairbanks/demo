require 'rails_helper'
require 'spec_helper'

RSpec.describe CommentsController, type: :controller do

  let(:user_role){ FactoryGirl.create(:role,{name:'user'})}

  let!(:user){FactoryGirl.create(:user,role_ids:[user_role.id])}

  let(:post_sample){FactoryGirl.create(:post)}

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
      content: "Here is a valid comment",
      post_id: post_sample.id,
      user_id: user.id
    }
  }

  let(:invalid_attributes) {
    {
      content: "",
      post_id: post_sample.id,
    }
  }

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new comment" do
        expect {post :create, params: {comment: valid_attributes} }.to change(Comment,:count).by(1)
      end
      it "redirects to new post" do
        post :create, params: {comment: valid_attributes}
        expect(response).to redirect_to(post_url(assigns(:comment).post_id))
      end
      it "produces valid create flash message" do
        post :create, params: {comment: valid_attributes}
        expect(flash[:notice]).to match(I18n.t("comment.successfully-created"))
      end

    end
    context "with invalid params" do
      it "creates comment" do
        post :create, params: {comment: invalid_attributes}
        expect(assigns(:comment)).to_not be_valid
      end
      it "renders new template" do
        post :create, params: {comment: invalid_attributes}
        expect(response).to redirect_to(post_url(assigns(:comment).post_id))
      end
      it "produces invalid flash message" do
        post :create, params: {comment: invalid_attributes}
        expect(flash[:notice]).to match(I18n.t("comment.not-successfully-created"))
      end

    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:update_attributes) {
        {
          content: "Here is a new updated valid comment",
          post_id: post_sample.id,
        }
      }
      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: update_attributes}
        comment.reload
        expect(comment.content).to eq("Here is a new updated valid comment")
      end
      it "redirects to post" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: update_attributes}
        expect(response).to redirect_to(post_url(comment.post_id))
      end
      it "produces valid update flash message" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: update_attributes}
        expect(flash[:notice]).to match(I18n.t("comment.successfully-updated"))
      end

    end

    context "with invalid params" do
      it "assigns the comment as @comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: invalid_attributes}
        expect(assigns(:comment)).to eq(comment)
      end
      it "redirects to post" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: invalid_attributes}
        expect(response).to redirect_to(post_url(comment.post_id))
      end
      it "produces invalid update flash message" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: invalid_attributes}
        expect(flash[:notice]).to match(I18n.t("comment.not-successfully-updated"))
      end

    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      valid_attributes[:user_id] = @admin.id
      comment = Comment.create! valid_attributes
      expect { delete :destroy, params: {id: comment.to_param} }.to change(Comment, :count).by(-1)
    end
    it "redirects to post" do
      valid_attributes[:user_id] = @admin.id
      comment = Comment.create! valid_attributes
      delete :destroy, params: {id: comment.to_param}
      expect(response).to redirect_to(post_url(comment.post_id))
    end
    it "produces valid destroy flash message" do
      valid_attributes[:user_id] = @admin.id
      comment = Comment.create! valid_attributes
      delete :destroy, params: {id: comment.to_param}
      expect(flash[:notice]).to match(I18n.t("comment.successfully-destroyed"))
    end

  end
end
