class Admin::UsersController < ApplicationController

  before_action :check_user
  before_action :find_user, except: [:index]

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @favorites = @user.favorites
  end

  def update_admin
    unless @user == current_user
      @user.update(admin: !@user.admin)
      redirect_to admin_users_path
    else
      redirect_to admin_users_path, notice: "You can't change your own status"
    end
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
    return redirect_to :root, alert: 'User not found' if @user.nil?
  end

end
