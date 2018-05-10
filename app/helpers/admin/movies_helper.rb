module Admin::MoviesHelper

  def featured_button_text(movie)
    return movie.featured ? "Remove Featured" : "Add to Featured"
  end

  def featured_button_class(movie)
    return movie.featured ? "btn btn-danger" : "btn btn-success"
  end

  def format_date(datetime)
    return datetime.strftime("%d %B %Y")
  end

  def movie_poster(movie, size = :thumb)
    return image_tag(movie.posters.last.image.url(size))
  end

  def back_to_movie_path(movie)
    movie.persisted? ? admin_movie_path : admin_movies_path(movie)
  end

end
