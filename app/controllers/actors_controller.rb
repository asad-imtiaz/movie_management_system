class ActorsController < ApplicationController

  before_action :find_actor, only: :show

  def show
  end

  def index
    @actors = Actor.all.page(params[:page])
  end

  private

  def find_actor
    @actor = Actor.find_by(id: params[:id])
    return redirect_to :root, alert: 'Actor not found' if @actor.nil?
  end
end
