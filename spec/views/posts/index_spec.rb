require 'rails_helper'

RSpec.describe 'posts/index', type: :view do
  before do
    @user = create(:user)
    @posts = create_list(:post, 5, author: @user) 
    render
  end

  it 'displays the posts' do
    @posts.each do |post|
      expect(rendered).to have_selector('div.boxes.comments-container', text: post.title)
    end
  end
end
