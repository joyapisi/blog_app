class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  before_save :update_like_posts_counter

  def update_like_posts_counter
    post = Post.find_by(id: post_id)
    post.increment!(:likes_counter)
  end
end
