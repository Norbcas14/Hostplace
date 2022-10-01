class PlacesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    @place.save
    # No need for app/views/restaurants/create.html.erb
    redirect_to root_path(@places)
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
    @place.user = current_user
  end

  def update
    @place = Place.find(params[:id])
    @place.update(place_params)
    redirect_to root_path(@places)
  end

  def destroy
    debugger
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def place_params
    params.require(:place).permit(:name, :country,  :address, :description, :picture)
  end
end
