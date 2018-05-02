class ReviewsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_review, only: [:flag, :destroy, :update]
  before_action :check_review_owner, only: [:destroy, :update]

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new(review_params)
    @review.user_id = current_user.id
    @review.save
  end

  def update
    @review.update(review_params)
  end

  def destroy
    @review.destroy
  end

  def flag
    @review.update(flagged: true)
    redirect_to movie_path(@review.movie)
  end

  def show_form
    @review = Review.find_or_initialize_by(user_id: current_user.id, movie_id: params[:movie_id])
  end

  private

  def review_params
    params.require(:review).permit(:movie_id, :content)
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def check_review_owner
    return Review.find(params[:id]).owner?(current_user)
  end

end
