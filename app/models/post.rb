class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  before_create :increment_author_posts_counter

  scope :recent_comments, ->(post) { post.comments.order('created_at DESC').limit(5) }

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :author_id, presence: true

  private

  def increment_author_posts_counter
    author.increment(:update_user_posts_counter).save
  end
end

