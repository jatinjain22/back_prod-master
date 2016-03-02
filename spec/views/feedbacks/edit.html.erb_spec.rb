require 'spec_helper'

describe "feedbacks/edit" do
  before(:each) do
    @feedback = assign(:feedback, stub_model(Feedback,
      :feedback => "MyText",
      :rating => ""
    ))
  end

  it "renders the edit feedback form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", feedback_path(@feedback), "post" do
      assert_select "textarea#feedback_feedback[name=?]", "feedback[feedback]"
      assert_select "input#feedback_rating[name=?]", "feedback[rating]"
    end
  end
end
