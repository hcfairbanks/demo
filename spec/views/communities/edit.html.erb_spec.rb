require 'rails_helper'

RSpec.describe "communities/edit", type: :view do
  before(:each) do
    @community = assign(:community, Community.create!(
      :name => "MyString",
      :user_id => 1,
      :status_id => 1
    ))
  end

  it "renders the edit community form" do
    render

    assert_select "form[action=?][method=?]", community_path(@community), "post" do

      assert_select "input#community_name[name=?]", "community[name]"

      assert_select "input#community_user_id[name=?]", "community[user_id]"

      assert_select "input#community_status_id[name=?]", "community[status_id]"
    end
  end
end
