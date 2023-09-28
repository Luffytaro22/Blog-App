class PostsController < ApplicationController
  def index
    @user_select = User.find(params[:user_id])
    @posts = Post.where(author: @user_select)
    @user = current_user
  end

  def show
    @id = params[:id]
    @user_select = User.find(params[:user_id])
    @posts = Post.where(author_id: @user_select.id)
    @post = @posts[@id.to_i - 1]
    @comments = Comment.where(post_id: @post.id)
  end

  def new
  	@post_new = Post.new
  	@user = current_user
  end

  def create
  	@post_new = Post.new(post_params)
  	@user = current_user
  	@post_new.author = @user

  	if @post_new.save
  		redirect_to user_posts_path(@user)
  	else
  		render :new, status: :unprocessable_entity
  	end
  end

  def edit
  	@user = current_user
  	@post = Post.find_by(author: @user, id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :author)
  end
end
