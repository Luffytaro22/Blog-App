class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
    @user_select = User.find(params[:id])
  end
end
