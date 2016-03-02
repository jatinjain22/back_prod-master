require 'spec_helper'

describe "recurrings/edit" do
  before(:each) do
    @recurring = assign(:recurring, stub_model(Recurring,
      :user_id => 1,
      :recurring_flag => 1,
      :last_date => "MyString",
      : => "MyString"
    ))
  end

  it "renders the edit recurring form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", recurring_path(@recurring), "post" do
      assert_select "input#recurring_user_id[name=?]", "recurring[user_id]"
      assert_select "input#recurring_recurring_flag[name=?]", "recurring[recurring_flag]"
      assert_select "input#recurring_last_date[name=?]", "recurring[last_date]"
      assert_select "input#recurring_[name=?]", "recurring[]"
    end
  end
end
