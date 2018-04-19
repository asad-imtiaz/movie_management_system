class Admin::MoviesController < ApplicationController

  before_action :check_user
  before_action :find_movie , only: [:edit, :destroy, :update]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      return redirect_to admin_movies_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      return redirect_to admin_movies_path
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    return redirect_to admin_movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def user_is_admin?
    user_signed_in? && current_user.admin?
  end

  def check_user
    return redirect_to root_url, alert: "Must be logged in as Admin" unless user_is_admin?
  end

end
