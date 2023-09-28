class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @user = current_user
    @comment = Comment.new(comment_params)
    @comment.user = @user
    @comment.post = @post
    @comment.save
    redirect_to user_post_path(params[:user_id], params[:id])
  end

	private
  def comment_params
    params.require(:comment).permit(:user, :post, :text)
  end
end