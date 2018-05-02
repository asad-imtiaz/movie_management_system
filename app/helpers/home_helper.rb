module HomeHelper

  def link_to_home
    return is_user_admin? ? admin_home_index_path : home_index_path
  end

end
