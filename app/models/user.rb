class User < ApplicationRecord
  has_many :posts
  def recent_posts
    posts.order("created_at DESC").limit(3)
  end
end
