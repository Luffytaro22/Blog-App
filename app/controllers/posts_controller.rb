class PostsController < ApplicationController
  def index
  	@user_select = User.find(params[:user_id])
  end

  def show
    puts params
  end
end
