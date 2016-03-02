require 'spec_helper'

describe "offline_users/edit" do
  before(:each) do
    @offline_user = assign(:offline_user, stub_model(OfflineUser,
      :name => "MyString",
      :address => "MyString",
      :contactno => 1
    ))
  end

  it "renders the edit offline_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", offline_user_path(@offline_user), "post" do
      assert_select "input#offline_user_name[name=?]", "offline_user[name]"
      assert_select "input#offline_user_address[name=?]", "offline_user[address]"
      assert_select "input#offline_user_contactno[name=?]", "offline_user[contactno]"
    end
  end
end
