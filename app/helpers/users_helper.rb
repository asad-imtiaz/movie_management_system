module UsersHelper

  def link_to_user(user)
    return is_user_admin? ? admin_user_path(user) : user_path(user)
  end

  def fav_button_class(movie)
    return current_user.favorites.exists?(movie.id) ? "glyphicon glyphicon-heart red" : "glyphicon glyphicon-heart-empty red"
  end

  def fav_button_text(movie)
    return current_user.favorites.exists?(movie.id) ? "Remove from Favorites" : "Add to Favorites"
  end

end
