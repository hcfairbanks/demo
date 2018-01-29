require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:user_role){ FactoryGirl.create(:role,{name:'user'})}
  let!(:user){FactoryGirl.create(:user,role_ids:[user_role.id])}

  let(:valid_attributes){
    {
      title: "My post",
      price: 10.00,
      content: "Some content here.",
      user_id: user.id,
      image_attributes:{photo: File.new(Rails.root.join('spec', 'fixtures', "binaries", "dog_1.jpg"))}
    }
  }
  let(:invalid_attributes){
    {
      title: "",
      price: 10.00,
      content: "Some content here."
    }
  }
  let(:update_attributes){
    {
      title: "My updated post",
      price: 12.00,
      content: "Some updated content here.",
      image_attributes:{photo: File.new(Rails.root.join('spec', 'fixtures', "binaries", "dog_2.jpg"))}
    }
  }

  it "create a post with valid attributes" do
    test_post = Post.create(valid_attributes)
    expect(test_post).to be_valid
  end

  it "create a post with valid image" do
    test_post = Post.create(valid_attributes)
    expect(test_post.image).to be_valid
  end

  it "create a post with invalid attributes" do
    test_post = Post.create(invalid_attributes)
    expect(test_post).to be_invalid
  end

  it "update a post with valid attributes" do
    test_post = Post.create(valid_attributes)
    test_post.update(update_attributes)
    test_post.reload
    expect(test_post).to be_valid
  end

  it "update a post with valid image" do
    test_post = Post.create(valid_attributes)
    test_post.update(update_attributes)
    test_post.reload
    expect(test_post.image).to be_valid
  end

  it "update a post with invalid attributes" do
    test_post = Post.create(valid_attributes)
    test_post.update(invalid_attributes)
    expect(test_post).to be_invalid
  end

  describe "delete a post" do

    it "decreases post count" do
      test_post = Post.create(valid_attributes)
      expect {Post.destroy(test_post.id)}.to change(Post, :count).by(-1)
    end

    it "post cant be found in db" do
      test_post = Post.create(valid_attributes)
      Post.destroy(test_post.id)
      expect(Post.where(id: test_post.id).count).to eq(0)
    end

    it "post image deleted" do
      test_post = Post.create(valid_attributes)
      Post.destroy(test_post.id)
      expect(Image.where(id: test_post.image.id).count).to eq(0)
    end

  end

end
