class BookingsController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @place = Place.find(params[:place_id])
    @booking.user = current_user
    @booking.place = @place
    @booking.save
    redirect_to root_path(@places)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
    @booking.user = current_user
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(place_params)
    redirect_to root_path(@places)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def booking_params
    params.require(:place).permit(:start_date, :end_date)
  end
end
