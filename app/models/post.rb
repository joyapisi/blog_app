class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id, counter_cache: true
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  scope :recent_comments, ->(post) { post.comments.order('created_at DESC').limit(5) }

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :author_id, presence: true

  def comments_counter
    comments.count
  end

  # Define likes_counter method to get the count of likes
  def likes_counter
    likes.count
  end
end
