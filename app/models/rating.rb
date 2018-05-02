class Rating < ActiveRecord::Base

  belongs_to :user
  belongs_to :movie

  validates :rating, inclusion: { in: 0..5 }

  after_save :update_movie_rating
  after_destroy :update_movie_rating

  def update_movie_rating
    rating = movie.ratings.where.not(rating: 0).average(:rating).to_f
    movie.update(rating: rating)
  end

end
