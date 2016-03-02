require 'spec_helper'

describe "recurrings/index" do
  before(:each) do
    assign(:recurrings, [
      stub_model(Recurring,
        :user_id => 1,
        :recurring_flag => 2,
        :last_date => "Last Date",
        : => ""
      ),
      stub_model(Recurring,
        :user_id => 1,
        :recurring_flag => 2,
        :last_date => "Last Date",
        : => ""
      )
    ])
  end

  it "renders a list of recurrings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Last Date".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
