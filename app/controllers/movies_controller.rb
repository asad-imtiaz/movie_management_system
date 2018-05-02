class MoviesController < ApplicationController

  before_action :find_movie, only: :show

  def index
    @movies = Movie.all.page(params[:page])
    @movies = Movie.featured.page(params[:page]) if params[:category] == 'featured'
    @movies = Movie.top_rated.page(params[:page]) if params[:category] == 'top'
    @movies = Movie.latest.page(params[:page]) if params[:category] == 'latest'
    @movies = Movie.upcoming.page(params[:page]) if params[:category] == 'upcoming'
  end

  def show
    @reviews = @movie.reviews.where(flagged: false)
    @rating = Rating.find_or_initialize_by(user_id: current_user.id, movie_id: @movie.id) if current_user
  end

  private

  def find_movie
    @movie = Movie.find_by_id(params[:id])
    return redirect_to :root, alert: 'Movie not found' if @movie.nil?
  end

end
