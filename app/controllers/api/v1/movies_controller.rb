module Api::V1
  class MoviesController < ApiController

    def index
      movies = Movie.advance_search(params)
      respond_to do |format|
        format.json { render json: movies.map { |movie| movie_hash movie } }
      end
    end

    def show
      movie = Movie.includes(:actors, :reviews, :ratings).find(params[:id])
      respond_to do |format|
        format.json { render json: movie_hash(movie) }
      end
    end

    def movie_hash(movie)
      {
        id: movie.id,
        title: movie.title,
        release_date: movie.release_date,
        genre: movie.genre,
        actors: movie.actors.map{ |actor| {name: actor.name} },
        reviews: movie.reviews.map{ |review| {
          user: review.user.full_name,
          content: review.content}
          },
        ratings: movie.ratings.map{ |rating| {
          user: rating.user.full_name,
          rating: rating.rating}
          },
      }
    end
  end
end
