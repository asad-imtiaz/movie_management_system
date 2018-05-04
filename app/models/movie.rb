class Movie < ActiveRecord::Base

  GENRE = ["Horror", "Thriller", "Action", "Comedy"]
  NO_OF_MOVIES_ON_HOME = 5
  PER_PAGE = 5

  has_and_belongs_to_many :actors
  has_and_belongs_to_many :users
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_attached_file :poster,
                      styles: { poster: "184x274!", thumb: "100x300" },
                      default_url: ":style/poster_missing.jpg"

  scope :top_rated, -> { order(rating: :desc) }
  scope :latest, -> { where("release_date < ?", DateTime.now).order(release_date: :desc) }
  scope :upcoming, -> { where("release_date > ?", DateTime.now).order(:release_date) }
  scope :featured, -> { where(featured: true) }

  validates :title, presence: true, length: { maximum: 50}
  validates :genre, presence: true, inclusion: { in: GENRE }

  after_save ThinkingSphinx::RealTime.callback_for(:movie)

  def movie_actors
    actors.collect(&:name).join(' ')
  end

  def self.advance_search(params)
    search_params = {
      conditions: {},
      page: params[:page],
      per_page: PER_PAGE,
     }
    search_params[:conditions][:genre] = params[:genre] if params[:genre]
    search_params[:conditions][:actors] = params[:actor] if params[:actor]
    search_params[:conditions][[:title, :description]] = params[:movie] if params[:movie]
    self.search(params[:search], search_params)
  end

  def self.search_category(params)
    movies = case params[:category]
    when 'featured'
      featured
    when 'top'
      top_rated
    when 'latest'
      latest
    when 'upcoming'
      upcoming
    end
    movies.page(params[:page])
  end

end
