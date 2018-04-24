module Admin::UsersHelper

  def display_admin user
    user.admin? ? "admin" : ""
  end

end
