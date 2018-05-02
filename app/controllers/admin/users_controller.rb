class Admin::UsersController < ApplicationController

  before_action :check_user

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    @favorites = @user.favorites
  end

end
