class PostsController < ApplicationController
  def index
    @user_select = User.find(params[:user_id])
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
  	@post_new = Post.new(params.require(:post_new).permit(:title, :body))

  	if @post_new.save
  		redirect_to @post_new
  	else
  		render :new, status: :unprocessable_entity
  	end
  end
end
