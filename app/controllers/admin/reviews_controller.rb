class Admin::ReviewsController < ApplicationController

  before_action :check_user
  before_action :find_review, only: [:unflag, :destroy]

  def index
    @reviews = Review.where(flagged: true)
  end

  def flagged
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews.where(flagged: true)
  end

  def destroy
    @review.destroy
    return redirect_to :back
  end

  def unflag
    @review.update(flagged: false)
    return redirect_to :back
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

end
