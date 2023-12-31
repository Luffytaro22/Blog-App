class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'
  after_initialize :set_defaults
  after_create :update_posts
  after_destroy :decrease_posts_counter
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  # Initialize counter to zero if they are nil.
  def set_defaults
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end

  # Method to update the posts_counter for a user.
  def update_posts
    user = User.find_by(id: author_id)
    user.increment!(:posts_counter)
  end

  def decrease_posts_counter
    user = User.find_by(id: author_id)
    user.decrement!(:posts_counter)
  end

  # Method to return the 5 most recent comments for a post.
  def recent_comments
    Comment
      .where(post_id: id)
      .includes(:user)
      .order(updated_at: :desc)
      .limit(5)
  end
end
