require 'rails_helper'

RSpec.describe "communities/new", type: :view do
  before(:each) do
    assign(:community, Community.new(
      :name => "MyString",
      :user_id => 1,
      :status_id => 1
    ))
  end

  it "renders new community form" do
    render

    assert_select "form[action=?][method=?]", communities_path, "post" do

      assert_select "input#community_name[name=?]", "community[name]"

      assert_select "input#community_user_id[name=?]", "community[user_id]"

      assert_select "input#community_status_id[name=?]", "community[status_id]"
    end
  end
end
