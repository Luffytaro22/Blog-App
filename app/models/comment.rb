class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def initialize(*args)
  	super(*args)
  	update_comments_counter if args.any? # Executes the method only if an argument is provided.
  end

  # Method to update the comments counter for a post.
  def update_comments_counter
  	post = Post.find_by(id: post_id)
  	if post.comments_counter.nil?
      counter = 1
    else
     	counter = post.comments_counter + 1
    end
    post.update(comments_counter: counter)
  end
end
