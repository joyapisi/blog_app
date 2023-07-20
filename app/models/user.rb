class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :posts, through: :likes, foreign_key: :author_id
  has_many :posts, through: :comments, foreign_key: :author_id

  scope :recent_posts, ->(user) { user.posts.order('created_at DESC').limit(3) }

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
