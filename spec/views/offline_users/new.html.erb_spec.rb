require 'spec_helper'

describe "offline_users/new" do
  before(:each) do
    assign(:offline_user, stub_model(OfflineUser,
      :name => "MyString",
      :address => "MyString",
      :contactno => 1
    ).as_new_record)
  end

  it "renders new offline_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", offline_users_path, "post" do
      assert_select "input#offline_user_name[name=?]", "offline_user[name]"
      assert_select "input#offline_user_address[name=?]", "offline_user[address]"
      assert_select "input#offline_user_contactno[name=?]", "offline_user[contactno]"
    end
  end
end
