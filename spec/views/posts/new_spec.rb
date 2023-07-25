require 'rails_helper'

RSpec.describe 'posts/new', type: :system do
  it 'renders the new post form' do
    visit post_new_path
    expect(page).to have_content('New Post')
  end

  it 'allows creating a new post' do
    visit post_new_path

    fill_in 'post_title', with: '1 New Post'
    fill_in 'post_text', with: 'This is my new post'
    click_button 'Create Post'

    expect(page).to have_content('Post created successfully.')
    expect(page).to have_current_path(some_path)
  end
end
