require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:user_role){ FactoryGirl.create(:role,{name:'user'})}
  let!(:user){FactoryGirl.create(:user,role_ids:[user_role.id])}
  let(:post){ FactoryGirl.create(:post,{user_id:user.id})}

  let(:valid_attributes){
    {
      content: "Some content here.",
      user_id: user.id ,
      post_id: post.id
    }
  }
  let(:invalid_attributes){
    {
      content: ""
    }
  }
  let(:update_attributes){
    {
      content: "Some updated content here."
    }
  }

  it "Create a comment with valid attributes" do
    test_comment = Comment.create(valid_attributes)
    expect(test_comment).to be_valid
  end

  it "Create a comment with invalid attributes" do
    test_comment = Comment.create(invalid_attributes)
    expect(test_comment.errors.messages[:content]).to eq(["can't be blank"])
  end

  it "Update a comment with valid attributes" do
    test_comment = Comment.create(valid_attributes)
    expect(test_comment).to be_valid
  end

  it "Update a comment with invalid attributes" do
    test_comment = Comment.create(valid_attributes)
    test_comment.update(invalid_attributes)
    expect(test_comment).to be_invalid
  end

  describe "Delete a comment" do

    it "decreases comment count" do
      test_comment = Comment.create(valid_attributes)
      expect {Comment.destroy(test_comment.id)}.to change(Comment, :count).by(-1)
    end

    it "deleted comment no longer in db" do
      test_comment = Comment.create(valid_attributes)
      Comment.destroy(test_comment.id)
      expect(Comment.where(id: test_comment.id).count).to eq(0)
    end

  end

end
