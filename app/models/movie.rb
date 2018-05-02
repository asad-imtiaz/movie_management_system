class Movie < ActiveRecord::Base

  has_and_belongs_to_many :actors
  has_and_belongs_to_many :users
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy

  NO_OF_MOVIES_ON_HOME = 5

  validates :title, presence: true

  has_attached_file :poster,
                      styles: { poster: "184x274!", thumb: "100x300" },
                      default_url: ":style/poster_missing.jpg"

  scope :top_rated, -> { order(rating: :desc) }
  scope :latest, -> { where("release_date < ?", DateTime.now).order(release_date: :desc) }
  scope :upcoming, -> { where("release_date > ?", DateTime.now).order(:release_date) }
  scope :featured, -> { where(featured: true) }

end
