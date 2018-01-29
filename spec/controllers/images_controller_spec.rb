require 'rails_helper'
require 'spec_helper'

RSpec.describe ImagesController, type: :controller do

  let(:user_role){ FactoryGirl.create(:role,{name:'user'})}

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


  let!(:sample_user){User.create({
    first_name:"test_2",
    last_name:"FAIRBANKS",
    dob: "2016/6/16",
    city:"Halifax",
    province:"Nova Scotia",
    email:"valid_attributes_test@test.com",
    password:"password",
    password_confirmation:"password",
    role_ids:[user_role.id],
    image_attributes:{photo: fixture_file_upload('/binaries/dog_2.jpg','image/jpg', "true")}
  })}

  let!(:sample_post){Post.create({
    title: "My post",
    price: 10.00,
    content: "Some content here.",
    user_id: sample_user.id,
    image_attributes:{photo: fixture_file_upload('/binaries/dog_1.jpg','image/jpg', "true")}
  })}

  describe "GET user image" do
    it "content type is image/jpeg" do
      get :serve_image, params:  {id:sample_user.image.id, type:"medium"}
      expect(response["Content-Type"]).to eq("image/jpeg")
    end
    it "file name is dog_2.jpg" do
      get :serve_image, params: {id:sample_user.image.id, type:"medium"}
      expect(response["Content-Disposition"]).to eq("inline; filename=\"dog_2.jpg\"")
    end
    it "content is binary" do
      get :serve_image, params: {id:sample_user.image.id, type:"medium"}
      expect(response["Content-Transfer-Encoding"]).to eq("binary")
    end
  end

  describe "GET post image" do
    it "content type is image/jpeg" do
      get :serve_image, params: {id:sample_post.image.id, type:"medium"}
      expect(response["Content-Type"]).to eq("image/jpeg")
    end
    it "file name is dog_1.jpg" do
      get :serve_image, params: {id:sample_post.image.id, type:"medium"}
      expect(response["Content-Disposition"]).to eq("inline; filename=\"dog_1.jpg\"")
    end
    it "content is binary" do
      get :serve_image, params: {id:sample_post.image.id, type:"medium"}
      expect(response["Content-Transfer-Encoding"]).to eq("binary")
    end
  end

end
