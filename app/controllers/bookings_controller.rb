class BookingsController < ApplicationController
  def create
    @planet = Planet.find(params[:planet_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.planet = @planet

    if @booking.save
      redirect_to user_path(current_user), notice: 'Booking was succesfully created'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end)
  end
end
