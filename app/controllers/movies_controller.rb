class MoviesController < ApplicationController

  def index
    @movies= Movie.all
  end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

end
