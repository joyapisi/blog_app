class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'author_id', dependent: :destroy, counter_cache: true
  has_many :likes, class_name: 'Like', foreign_key: 'author_id', dependent: :destroy
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id', dependent: :destroy

  scope :recent_posts, ->(user) { user.posts.includes(:comments).order('created_at DESC').limit(3) }

  validates :name, presence: true
end
