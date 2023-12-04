class UsersController < ApplicationController
  before_action :find_user
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user_select = User.find(params[:id])
  end

  private

  def find_user
    @user = current_user
  end
end
