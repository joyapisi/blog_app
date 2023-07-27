require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  let(:url1) { 'https://images.unsplash.com/photo-1507152832244-10d45c7eda57?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80' }
  let!(:user1) do
    User.create(
      name: 'Wajo',
      photo: url1,
      bio: 'Teacher from Poland',
      posts_counter: 0
    )
  end
  let!(:post1) do
    Post.create(
      title: 'Second post',
      text: 'This is my second post',
      comments_counter: 0,
      likes_counter: 0,
      author: user1
    )
  end
  describe 'post index' do
    before(:each) do
      visit "/users/#{user1.id}/posts"
    end

    it 'Enables user to view the user\'s photo.' do
      expect(page).to have_xpath("//img[contains(@src,'#{url1}')]")
    end
    it 'Enables user to view the user\'s username.' do
      expect(page).to have_content(user1.name)
    end
    it 'Enables user to view the number of posts the user has written.' do
      expect(page).to have_content 'Number of posts: 1'
    end
    it 'Enables user to view a post\'s title.' do
      expect(page).to have_content 'Second post'
    end
    it 'Enables user to view some of the post\'s body.' do
      expect(page).to have_content 'This is my second post'
    end
    it 'Enables user to view the first comments on a post.' do
      expect(page).to have_content 'Awesome!'
    end
    it 'Enables user to view how many comments a post has.' do
      expect(page).to have_content 'Comments: 1'
      expect(page).to_not have_content 'Comments: 0'
    end
    it 'Enables user to view how many likes a post has.' do
      expect(page).to have_content 'Likes: 0'
      expect(page).to_not have_content 'Likes: 1'
    end
    it 'Enables user to view a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content 'Pagination'
    end
    it 'When I click on a post, it redirects me to that posts show page.' do
      click_link 'Second post'
      expect(page).to have_content 'This is my second post'
    end
  end

  describe 'post show' do
    before(:each) do
      visit "/users/#{user1.id}/posts/#{Post.first.id}"
    end
    it 'Enables user to view the posts title.' do
      expect(page).to have_content 'Second Post'
    end
    it 'Enables user to view who wrote the post.' do
      expect(page).to have_content 'Wajo'
      expect(page).to have_content 'Second Post by Wajo'
    end
    it 'Enables user to view how many comments it has.' do
      expect(page).to have_content 'Comments: 1'
      expect(page).to_not have_content 'Comments: 0'
    end
    it 'Enables user to view how many likes it has.' do
      expect(page).to have_content 'likes: 0'
      expect(page).to_not have_content 'likes: 1'
    end
    it 'Enables user to view the post body.' do
      expect(page).to have_content 'post content 1'
    end
    it 'Enables user to view the username of each commentor.' do
      expect(page).to have_content user1.name.to_s
    end
    it 'Enables user to view the comment each commentor left.' do
      expect(page).to have_content 'First comment from Tom'
    end
  end
end
