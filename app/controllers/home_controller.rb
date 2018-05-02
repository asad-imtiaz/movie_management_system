class HomeController < ApplicationController

  def index
    @movies = Movie.first(Movie::NO_OF_MOVIES_ON_HOME)
    @featured_movies = Movie.featured.first(Movie::NO_OF_MOVIES_ON_HOME)
    @top_movies = Movie.top_rated.first(Movie::NO_OF_MOVIES_ON_HOME)
    @latest_movies = Movie.latest.first(Movie::NO_OF_MOVIES_ON_HOME)
    @upcoming_movies = Movie.upcoming.first(Movie::NO_OF_MOVIES_ON_HOME)
  end

end
