class User < ApplicationRecord
  before_validation :set_default
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  :confirmable
  has_many :posts, class_name: 'Post', foreign_key: 'author_id', dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'author_id', dependent: :destroy
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id', dependent: :destroy

  scope :recent_posts, ->(user) { user.posts.includes(:comments).order('created_at DESC').limit(3) }
  attribute :posts_counter, :integer, default: 0

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def set_default
  self.name = email.split("@")[0]
  self.posts_counter = 0
end

end
