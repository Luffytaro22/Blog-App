class ApplicationController < ActionController::Base
  # Method to return the first user from the database.
  def current_user
    User.first
  end
end
