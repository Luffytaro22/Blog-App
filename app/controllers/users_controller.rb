class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user_select = User.find(params[:id])
    @user = current_user
  end
end
