class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  # Method to return the 3 most recent posts for a given user.
  def recent_posts
    Post
      .where(author_id: id)
      .order(updated_at: :desc)
      .limit(3)
  end
end
