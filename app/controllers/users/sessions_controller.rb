class Users::SessionsController < Devise::SessionsController

  protected

  def after_sign_in_path_for(resource)
    resource.admin ? admin_home_index_path : home_index_path
  end

end
