require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should belong_to(:post) }
  end

  describe '#update_comment_posts_counter' do
    let(:post) { create(:post) }
    let(:comment) { create(:comment, post:) }

    it 'updates the post comments counter' do
      expect { comment.update_comment_posts_counter }.to change { post.reload.comments_counter }.by(1)
    end
  end
end
