module ActorsHelper

  def actor_show(actor)
    current_user && current_user.admin ? admin_actor_path(actor) : actor_path(actor)
  end

end
