class ActorsController < ApplicationController

  before_action :find_actor, only: :show

  def show
  end

  def index
    @actors = Actor.all
  end

  private

  def find_actor
    @actor = Actor.find(params[:id])
  end
end
