require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before(:each) do
    url1 = 'https://images.unsplash.com/photo-1507152832244-10d45c7eda57?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80'
    url2 = 'https://images.unsplash.com/photo-1504199367641-aba8151af406?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80'

    User.create(name: 'Wajo', photo: url1, bio: 'Teacher from Poland', posts_counter: 0)
    User.create(name: 'Tom', photo: url2, bio: 'Developer from Kenya', posts_counter: 0)
  end

  describe 'users index' do
    before(:each) do
      visit users_path
    end
    it 'should show the username of all other users.' do
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user2.name)
    end
    it 'should show the profile picture for each user.' do
      expect(page).to have_xpath("//img[contains(@src,'#{url1}')]")
    end
    it 'should show number of posts each user has written.' do
      expect(page).to have_content 'Number of posts: 0'
    end

    it 'should redirected to that user show page, When I click on a user' do
      click_link 'wajo Tsegaye'
      expect(page).to have_current_path("/users/#{user1.id}")
    end
  end

  describe 'users/show' do
    before(:each) do
      url1 = 'https://images.unsplash.com/photo-1507152832244-10d45c7eda57?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80'

      user1 = User.create(name: 'Wajo',
                          photo: url1, bio: 'Teacher from Poland',
                          posts_counter: 0)

      Post.create(title: 'Second post',
                  text: 'This is my second post',
                  comments_counter: 0,
                  likes_counter: 0,
                  author: user1)

      Post.create(title: 'My last post',
                  text: 'last',
                  comment_counter: 0,
                  likes_counter: 0,
                  author: user1)

      visit user_path(user1.id)
    end
    it 'should show the profile picture for each user.' do
      expect(page).to have_xpath("//img[contains(@src,'#{url1}')]")
    end
    it 'should show the username of all other users.' do
      expect(page).to have_content(user1.name)
      expect(page).to_not have_content(kelly.name)
    end
    it 'should show number of posts each user has written.' do
      expect(page).to have_content 'Number of posts: 1'
    end
    it 'I can see the user bio.' do
      expect(page).to have_content 'last'
    end
    it 'I can see the user first 3 posts.' do
      expect(page).to_not have_content 'content'
    end
    it 'I can see a button that lets me view all of a users posts.' do
      expect(page).to have_content 'See all Posts'
    end
    it 'When I click a users post, it redirects me to that posts show page.' do
      visit "/users/#{user1.id}/posts/#{post1.id}"
      expect(page).to have_content 'This is my second post'
    end
    it 'When I click to see all posts, it redirects me to the users posts index page.' do
      click_link 'See all Posts'
      expect(page).to have_content 'This is my second post'
    end
  end
end