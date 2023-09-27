class PostsController < ApplicationController
  def index
  	@user_select = User.find(params[:user_id])
  end

  def show
    @id = params[:id]
    @user_select = User.find(params[:user_id])
    @post = @user_select.recent_posts[@id.to_i - 1]
    @comments = Comment.where(post_id: @post.id)
  end
end
