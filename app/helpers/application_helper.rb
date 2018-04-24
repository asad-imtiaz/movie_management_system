module ApplicationHelper

  def profile_picture(user, size = :thumb)
    user.profile_pic.url(size)
  end

  def link_to_movie_show(movie)
    return current_user.try(:admin) ? admin_movie_path(movie) : movie_path(movie)
  end

  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-danger"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

end
