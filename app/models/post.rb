class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  before_save -> { User.find_by(id: author.id).increment!(:update_user_posts_counter) }

  scope :recent_comments, ->(post) { post.comments.order('created_at DESC').limit(5) }

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # def update_user_posts_counter
  #   author.update(posts_counter: author.posts.count)
  # end

  # def recent_comments
  #   comments.order('created_at DESC').limit(5)
  # end
end
