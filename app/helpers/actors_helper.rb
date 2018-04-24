module ActorsHelper

  def actor_show(actor)
    current_user.try(:admin) ? admin_actor_path(actor) : actor_path(actor)
  end

end
