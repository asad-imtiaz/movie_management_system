module ApplicationHelper

  def link_to_movie_show(movie)
    return is_user_admin? ? admin_movie_path(movie) : movie_path(movie)
  end

  def link_to_movies_list(param = nil)
    return is_user_admin? ? admin_movies_path(category: param) : movies_path(category: param)
  end

  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
      when :success
        "alert-success"
      when :error
        "alert-danger"
      when :alert
        "alert-warning"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def is_user_admin?
    return current_user && current_user.admin?
  end

end
