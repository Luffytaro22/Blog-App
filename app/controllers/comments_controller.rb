class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @comment = Comment.new(comment_params)
    @comment.user = @user
    @comment.post = @post
    if @comment.save
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      puts @comment.errors.full_messages
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
