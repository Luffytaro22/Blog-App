class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  after_create :update_likes_counter
  after_destroy :decrease_likes_counter

  # Method to update the likes counter for a post.
  def update_likes_counter
    post = Post.find_by(id: post_id)
    post.increment!(:likes_counter)
  end

  def decrease_likes_counter
  	post = Post.find_by(id: post_id)
  	post.decrement!(:likes_counter)
  end
end
