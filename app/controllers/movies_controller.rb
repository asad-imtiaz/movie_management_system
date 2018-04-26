class MoviesController < ApplicationController

   before_action :find_movie, only: :show

  def index
    @movies = Movie.all.page(params[:page])
  end

  def show
    @reviews = @movie.reviews.where(flagged: false)
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

end
