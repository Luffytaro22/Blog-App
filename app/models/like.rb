class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def initialize
    update_likes_counter
   end

  # Method to update the likes counter for a post.
  def update_likes_counter
   	post = Post.find_by(id: :post)
    if post.likes_counter.nil?
       counter = 1
    else
       counter = post.likes_counter + 1
    end
    post.update(likes_counter: counter)
  end
end
