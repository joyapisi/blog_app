# require 'rails_helper'

# RSpec.describe 'posts/show', type: :system do
#   it 'displays a post and its comments correctly' do

#     user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')

#     post = Post.create(author: user, title: 'Post Title', text: 'Post body')


#     Comment.create(author: user, post: post, text: 'Comment message 1')
#     Comment.create(author: user, post: post, text: 'Comment message 2')

#     visit post_path(post)

#     expect(page).to have_content('Post Title')
#     expect(page).to have_content('Post body')

#     expect(page).to have_content('Comment message 1')
#     expect(page).to have_content('Comment message 2')
#   end
# end
