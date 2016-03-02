require 'spec_helper'

describe "recurrings/show" do
  before(:each) do
    @recurring = assign(:recurring, stub_model(Recurring,
      :user_id => 1,
      :recurring_flag => 2,
      :last_date => "Last Date",
      : => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Last Date/)
    rendered.should match(//)
  end
end
