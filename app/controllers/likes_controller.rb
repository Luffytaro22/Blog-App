class LikesController < ApplicationController
  load_and_authorize_resource
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    return if already_liked?

    @post.likes.create(user_id: current_user.id)

    redirect_to request.referrer
  end

  def destroy
    return unless already_liked?

    @like.destroy

    redirect_to request.referrer
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
    @user = current_user
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: @user.id, post_id: params[:post_id]).exists?
  end
end
