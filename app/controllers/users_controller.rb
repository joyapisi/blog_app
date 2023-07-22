class UsersController < ApplicationController
  # layout 'users'
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:user_id])
  end
end
