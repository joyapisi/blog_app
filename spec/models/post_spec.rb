require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe '#update_user_posts_counter' do
    let(:user) { create(:user) }
    let(:post) { create(:post, author: user) }

    it 'updates the user posts counter' do
      expect { post.update_user_posts_counter }.to change { user.reload.posts_counter }.by(1)
    end
  end

  describe '#recent_comments' do
    let(:post) { create(:post) }

    it 'returns the five most recent comments' do
      older_comments = create_list(:comment, 3, post:, created_at: 1.week.ago)
      recent_comments = create_list(:comment, 5, post:, created_at: Time.now)

      expect(post.recent_comments).to eq(recent_comments)
      expect(post.recent_comments).to_not include(older_comments)
    end
  end
end
