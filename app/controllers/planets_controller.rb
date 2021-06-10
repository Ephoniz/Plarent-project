class PlanetsController < ApplicationController
  before_action :set_planet, only: %i[show edit update]

  def index
    @filter = PlanetFilter.new(params)
    @planets = @filter.filter!
  end

  def show
    @booking = Booking.new
    @user = @planet.owner
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(planets_params)
    

    if @planet.save
      redirect_to @planet, notice: 'Planet was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @planet.update(planets_params)
        format.html { redirect_to @planet, notice: "planet was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @planet = Planet.find(params[:id])
    @planet.destroy
    redirect_to user_path(current_user), notice: 'Planet was successfully deleted.'
  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
  end

  def planets_params
    params.require(:planet).permit(:name, :atmosphere, :galaxy, :radius, :temperature, :price, :description, photos: [])
  end
end
