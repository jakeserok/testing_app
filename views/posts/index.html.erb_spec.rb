require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        title: "Hello World",
        body: "MyText",
        user: curr_user,
        views: 12
      ),
      Post.create!(
        title: "Title",
        body: "This is my test",
        user: curr_user,
        views: 21
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 1
    assert_select "tr>td", text: "Hello World".to_s, count: 1
    assert_select "tr>td", text: "MyText".to_s, count: 1
    assert_select "tr>td", text: "This is my test".to_s, count: 1
    assert_select "tr>td", text: curr_user.id.to_s, count: 2
    assert_select "tr>td", text: 12.to_s, count: 1
    assert_select "tr>td", text: 21.to_s, count: 1
  end
end
