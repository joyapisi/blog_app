class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post', counter_cache: true

  before_save :update_like_posts_counter

  def update_like_posts_counter
    post.increment!(:likes_counter)
  end
end
