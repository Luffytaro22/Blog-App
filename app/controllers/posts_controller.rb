class PostsController < ApplicationController
  def index
  	@user_select = User.find(params[:user_id])
  end

  def show
    @id = params[:id]
    @user_select = User.find(params[:user_id])
    @post = Post.where(author_id: @user_select.id)[@id.to_i - 1]
    @comments = Comment.where(post_id: @post.id)
  end
end
