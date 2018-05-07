module ActorsHelper

  def actor_show(actor)
    is_user_admin? ? admin_actor_path(actor) : actor_path(actor)
  end

  def link_to_actors
    is_user_admin? ? admin_actors_path : actors_path
  end

  def headshot(actor, size = :thumb)
    return actor.headshot.url(size)
  end

  def set_actors_list
    Actor.pluck(:name)
  end

end
