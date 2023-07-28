class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  before_save :update_like_posts_counter

  def update_like_posts_counter
    Post.find_by(id: post_id).increment!(:likes_counter)
  end
end
