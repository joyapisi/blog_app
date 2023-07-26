# require_relative '../app/models/user.rb'
require_relative '../rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:posts_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'associations' do
    it { should have_many(:posts).class_name('Post').with_foreign_key('author_id') }
    it { should have_many(:likes).class_name('Like').with_foreign_key('author_id') }
    it { should have_many(:comments).class_name('Comment').with_foreign_key('author_id') }
  end

  describe '#recent_posts' do
    let(:user) { create(:user) }

    it 'returns the most recent 3 posts' do
      user.posts.create(title: 'Post 1', created_at: 2.days.ago)
      user.posts.create(title: 'Post 2', created_at: 1.day.ago)
      user.posts.create(title: 'Post 3', created_at: Time.now)
      user.posts.create(title: 'Post 4', created_at: 3.days.ago)

      expect(user.recent_posts.count).to eq(3)
      expect(user.recent_posts.pluck(:title)).to eq(['Post 3', 'Post 2', 'Post 1'])
    end
  end
end
