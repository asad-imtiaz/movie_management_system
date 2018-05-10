class Admin::MoviesController < ApplicationController

  before_action :check_user
  before_action :find_movie , only: [:edit, :edit_poster, :update_poster, :show, :destroy, :update, :remove_poster, :set_featured]
  before_action :set_actors, only: [:new, :edit, :update, :create]

  def index
    @movies = Movie.advance_search(params)
    @movies = Movie.search_category(params) if params[:category]
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
    @reviews = @movie.reviews.where(flagged: false)
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

  def set_featured
    unless @movie.update(featured: !@movie.featured)
      flash[:alert] = "Try again"
    end
    redirect_to admin_movie_path(@movie)
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :release_date, :genre, :trailer_link, actor_ids: [], posters_attributes: [:id, :image, :_destroy])
  end

  def find_movie
    @movie = Movie.find_by(id: params[:id])
    return redirect_to :root, alert: 'Movie not found' if @movie.nil?
  end

  def set_actors
    @actors = Actor.select(:id, :name)
  end

end
