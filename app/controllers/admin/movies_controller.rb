class Admin::MoviesController < ApplicationController

  before_action :check_user
  before_action :find_movie , only: [:edit, :edit_poster, :update_poster, :show, :destroy, :update, :remove_poster]
  before_action :set_actors, only: [:new, :edit]

  def index
    @movies = Movie.all.page(params[:page])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:success] = "Movie added successfully"
      return redirect_to admin_movie_path @movie
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      flash[:success] = "Movie updated successfully"
      return redirect_to admin_movie_path @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    return redirect_to admin_movies_path
  end

  def remove_poster
    @movie.poster = nil
    if @movie.save
      flash[:success] = "Poster removed"
    else
      flash[:success] = "An error occured, please try again"
    end
      return redirect_to admin_movie_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description,:poster, :release_date, :trailer_link, actor_ids: [])
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def set_actors
    @actors = Actor.select(:id, :name)
  end

end
