class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'
  after_save :update_posts

  # Method to update the posts_counter for a user.
  def update_posts
    user = User.find_by(id: author_id)
    user.increment!(:posts_counter)
  end

  # Method to return the 5 most recent comments for a post.
  def recent_comments
    Comment
      .where(post_id: id)
      .order(updated_at: :desc)
      .limit(5)
  end
end
