require 'spec_helper'

describe "recurrings/new" do
  before(:each) do
    assign(:recurring, stub_model(Recurring,
      :user_id => 1,
      :recurring_flag => 1,
      :last_date => "MyString",
      : => "MyString"
    ).as_new_record)
  end

  it "renders new recurring form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", recurrings_path, "post" do
      assert_select "input#recurring_user_id[name=?]", "recurring[user_id]"
      assert_select "input#recurring_recurring_flag[name=?]", "recurring[recurring_flag]"
      assert_select "input#recurring_last_date[name=?]", "recurring[last_date]"
      assert_select "input#recurring_[name=?]", "recurring[]"
    end
  end
end
