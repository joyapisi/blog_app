require 'rails_helper'

RSpec.describe 'comments/new', type: :view do
  before do
    @user = create(:user) 
    assign(:comment, Comment.new)
    render
  end

  it 'displays the "New Comment" heading' do
    expect(rendered).to have_selector('h1', text: 'New Comment')
  end
  end