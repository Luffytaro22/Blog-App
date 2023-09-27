class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
    puts params
  end
end
