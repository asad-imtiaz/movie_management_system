module Admin::UsersHelper

  def profile_picture(user, size = :thumb)
    user.profile_pic.url(size)
  end

  def admin_text(user)
    user.admin ? "Remove admin" : "Make admin"
  end

end
