require 'rails_helper'

RSpec.describe "communities/index", type: :view do
  before(:each) do
    assign(:communities, [
      Community.create!(
        :name => "Name",
        :user_id => 2,
        :status_id => 3
      ),
      Community.create!(
        :name => "Name",
        :user_id => 2,
        :status_id => 3
      )
    ])
  end

  it "renders a list of communities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
