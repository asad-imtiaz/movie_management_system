module ActorsHelper

  def actor_show(actor)
    is_user_admin? ? admin_actor_path(actor) : actor_path(actor)
  end

end
