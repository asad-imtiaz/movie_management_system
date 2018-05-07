class Admin::ActorsController < ApplicationController

  before_action :check_user
  before_action :find_actor, only: [:edit, :show, :update, :destroy]

  def index
    @actors = Actor.all.page(params[:page]).per(10)
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      flash[:success] = "Actor successfully added"
      return redirect_to new_admin_actor_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @actor.update(actor_params)
      flash[:success] = "Actor successfully updated"
      return redirect_to admin_actors_path
    else
      render 'edit'
    end
  end

  def destroy
    @actor.destroy
    return redirect_to admin_actors_path
  end

  private

  def actor_params
    params.require(:actor).permit(:name, :headshot)
  end

  def find_actor
    @actor = Actor.find(params[:id])
  end

end
