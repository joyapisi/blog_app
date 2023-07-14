require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should belong_to(:post).class_name('Post') }
  end

  describe '#update_like_posts_counter' do
    let(:post) { create(:post) }
    let(:like) { create(:like, post:) }

    it 'updates the post likes counter' do
      expect { like.update_like_posts_counter }.to change { post.reload.likes_counter }.by(1)
    end
  end
end
