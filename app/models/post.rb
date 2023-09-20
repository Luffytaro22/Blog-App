class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  def initialize(*args)
    super(*args)
    update_posts if args.any? # Executes the method only if an argument is provided.
  end

  # Method to update the posts_counter for a user.
  def update_posts
    user = User.find_by(id: author_id)
    counter = if user.posts_counter.nil?
                1
              else
                user.posts_counter + 1
              end
    user.update(posts_counter: counter)
  end

  # Method to return the 5 most recent comments for a post.
  def recent_comments
    Comment
      .where(post_id: id)
      .order(updated_at: :desc)
      .limit(5)
  end
end
