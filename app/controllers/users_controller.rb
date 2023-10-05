class UsersController < ApplicationController
	load_and_authorize_resource
  def index
    @users = User.all
  end

  def show
    @user_select = User.find(params[:id])
    @user = current_user
  end
end
