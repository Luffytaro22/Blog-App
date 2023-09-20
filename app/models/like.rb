class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  after_save :update_likes_counter

  # Method to update the likes counter for a post.
  def update_likes_counter
    post = Post.find_by(id: post_id)
    post.increment!(:likes_counter)
  end
end
