class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  after_create :update_comments_counter

  # Method to update the comments counter for a post.
  def update_comments_counter
    post = Post.find_by(id: post_id)
    post.increment!(:comments_counter)
  end
end
