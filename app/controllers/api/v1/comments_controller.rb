class Api::V1::CommentsController < ApplicationController
  before_action :set_post # Find the post before creating a comment.

  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post_id: params[:post_id])
    render json: @comments
  end

  def create
    json_request = JSON.parse(request.body.read)
    text = json_request['text']
    author = @post.author

    @comment = @post.comments.new(text:, author:)
    if @comment.save
      render json: @comment
    else
      render json: { error: 'Invalid comment' }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
