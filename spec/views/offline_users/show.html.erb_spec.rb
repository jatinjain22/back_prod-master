require 'spec_helper'

describe "offline_users/show" do
  before(:each) do
    @offline_user = assign(:offline_user, stub_model(OfflineUser,
      :name => "Name",
      :address => "Address",
      :contactno => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Address/)
    rendered.should match(/1/)
  end
end
