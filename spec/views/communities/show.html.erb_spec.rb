require 'rails_helper'

RSpec.describe "communities/show", type: :view do
  before(:each) do
    @community = assign(:community, Community.create!(
      :name => "Name",
      :user_id => 2,
      :status_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
