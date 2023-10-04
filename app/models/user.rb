class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts
  has_many :comments
  has_many :likes
  validates :name, presence: true # Name must not be blank.
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  after_initialize :set_defaults

  # Initialize the posts_counter to zero if it's nil.
  def set_defaults
    self.posts_counter ||= 0
  end

  # Method to return the 3 most recent posts for a given user.
  def recent_posts
    Post
      .where(author_id: id)
      .order(updated_at: :desc)
      .limit(3)
  end
end
