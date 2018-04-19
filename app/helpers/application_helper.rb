module ApplicationHelper

  def profile_picture(user, size = :thumb)
    user.profile_pic.url(size)
  end

end
