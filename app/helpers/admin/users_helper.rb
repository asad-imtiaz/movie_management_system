module Admin::UsersHelper

  def display_admin user
    user.admin? ? "admin" : ""
  end

  def profile_picture(user, size = :thumb)
    user.profile_pic.url(size)
  end

end
