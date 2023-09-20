class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def initialize(*args)
    super(*args)
    update_likes_counter if args.any? # Executes the method only if an argument is provided.
  end

  # Method to update the likes counter for a post.
  def update_likes_counter
    post = Post.find_by(id: post_id)
    counter = if post.likes_counter.nil?
                1
              else
                post.likes_counter + 1
              end
    post.update(likes_counter: counter)
  end
end
