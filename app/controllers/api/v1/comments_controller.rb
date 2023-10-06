class Api::V1::CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post_id: params[:post_id])
    render json: @comments
  end
end
