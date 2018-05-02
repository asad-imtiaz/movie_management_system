class RatingsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_movie

  def create
    @rating = @movie.ratings.new(rating_params)
    @rating.user_id = current_user.id
    @rating.save
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.update(rating_params)
  end

  private

  def rating_params
    params.require(:rating).permit(:rating)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

end
