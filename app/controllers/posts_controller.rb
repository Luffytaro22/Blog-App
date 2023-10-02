class PostsController < ApplicationController
  def index
    @user_select = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
    @user = current_user
  end

  def show
    @id = params[:id]
    @user_select = User.find(params[:user_id])
    @user = current_user
    @posts = Post.where(author_id: @user_select.id)
    @post = Post.find(@id)
    @like = Like.find_by(user: @user, post: @post)
    @next_post = Post.where('id > ? AND author_id = ?', params[:id], @user_select.id).first
    @previous_post = Post.where('id < ? AND author_id = ?', params[:id], @user_select.id).last
    @comments = Comment.where(post_id: @post.id).includes(:user)
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @user = current_user
    @post.author = @user

    if @post.save
      redirect_to user_posts_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = current_user
    @post = Post.find_by(author: @user, id: params[:id])
  end

  def update
    @user = current_user
    @post = Post.find_by(author: @user, id: params[:id])

    if @post.update(post_params)
      redirect_to user_posts_path(@user)
    else
      render :edit, status: unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :author)
  end
end
