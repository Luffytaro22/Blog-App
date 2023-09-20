class Post < ApplicationRecord
	has_many :comments
	has_many :likes
  belongs_to :author, class_name: "User"

  def initialize
		update_posts
  end

  # Method to update the posts_counter for a user.
  def update_posts
  	user = User.find_by(id: :author)
  	if user.posts_counter.nil?
  		counter = 1
  	else
  		counter = user.posts_counter + 1
  	end
  	user.update(posts_counter: counter)
  end

  # Method to return the 5 most recent comments for a post.
  def recent_comments(post_id)
  	Comment
  		.where(post_id: post_id)
  		.order(updated_at: :desc)
  		.limit(5)
  end
end
