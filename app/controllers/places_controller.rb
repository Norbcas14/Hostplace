class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
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
    # @place = Place.find(params[:id])
    # debugger
  end

  def edit
    # @place = Place.find(params[:id])
    @place.user = current_user
  end

  def update
    @place = Place.find(params[:id])
    @place.update(place_params)
    redirect_to root_path(@places)
  end

  # def delete
  #   # debugger
  #   # @place = Place.find(params[:id])
  #   @place.destroy
  #   # redirect_to root_path, status: :see_other
  #   # respond_to do |format|
  #   #   format.html { redirect_to places_path, status: :see_other}
  #   #   flash[:notice] = "place was successfully deleted."
  #   #   format.json { head :no_content }
  #   # end
  #   redirect_to places_url, status: :see_other
  # end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    # debugger

    @place.destroy

    respond_to do |format|
      format.html { redirect_to places_url }
      flash[:notice] = "place was successfully deleted."
      format.json { head :see_other }
    end
  end

  # def destroy
  #   @place = Place.find(params[:id])
  #   redirect_to place_path(@place), status: :see_other
  # end

  private
  def place_params
    params.require(:place).permit(:name, :country,  :address, :description, :picture)
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
