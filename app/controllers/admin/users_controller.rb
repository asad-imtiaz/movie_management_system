class Admin::UsersController < ApplicationController

  before_action :check_user

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  private

  def user_admin?
    user_signed_in? && current_user.admin?
  end

  def check_user
    return redirect_to root_url, alert: "Must be logged in as Admin" unless user_admin?
  end

end
