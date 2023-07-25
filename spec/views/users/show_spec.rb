require 'rails_helper'

RSpec.describe 'users/show', type: :system do
  it 'displays a user and their posts correctly' do
    # Create a sample user with some associated posts
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    user.posts.create(title: 'Post 1', text: 'This is the first post')
    user.posts.create(title: 'Post 2', text: 'This is the second post')

    visit user_path(user)

    # Expect user details to be displayed
    expect(page).to have_content('John Doe')

    # Expect user's posts to be displayed
    expect(page).to have_content('Post 1')
    expect(page).to have_content('This is the first post')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('This is the second post')
  end
end
