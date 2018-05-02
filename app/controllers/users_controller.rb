class UsersController < ApplicationController

  before_action :find_user, only: :show
  before_action :find_movie, only: :update_favorite
  before_action :authenticate_user!, only: :set_favorite

  def show
    @favorites = @user.favorites
  end

  def update_favorite
    unless current_user.favorites.exists?(@movie.id)
      current_user.favorites << @movie
    else
      current_user.favorites.destroy(@movie)
    end
    redirect_to :back
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def allowed_params
    params.permit(:id)
  end

end
