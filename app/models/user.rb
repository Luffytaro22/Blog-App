class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  validates :user, presence: true # Name must not be blank.
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }

  # Method to return the 3 most recent posts for a given user.
  def recent_posts
    Post
      .where(author_id: id)
      .order(updated_at: :desc)
      .limit(3)
  end
end
