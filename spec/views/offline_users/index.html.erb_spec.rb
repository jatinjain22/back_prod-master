require 'spec_helper'

describe "offline_users/index" do
  before(:each) do
    assign(:offline_users, [
      stub_model(OfflineUser,
        :name => "Name",
        :address => "Address",
        :contactno => 1
      ),
      stub_model(OfflineUser,
        :name => "Name",
        :address => "Address",
        :contactno => 1
      )
    ])
  end

  it "renders a list of offline_users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
