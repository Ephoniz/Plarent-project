class PlanetsController < ApplicationController
  before_action :set_planet, only: %i[show]
  def index
    @planets = Planet.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
  end

  def planets_params
    params.require(:planet).permit(:name)
  end
end
