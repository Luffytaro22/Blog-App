class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def initialize
  	update_posts_counter
  end

  # Method to update the comments counter for a post.
  def update_posts_counter
  	post = Post.find_by(id: :post)
  	if post.comments_counter.nil?
      counter = 1
    else
     	counter = post.comments_counter + 1
    end
    post.update(comments_counter: counter)
  end
end
