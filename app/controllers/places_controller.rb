class PlacesController < ApplicationController
  before_action :set_place, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def show
    # @place = Place.find(params[:id])
    # debugger
  end

  def edit
    redirect_to root_path unless @place.user == current_user
    # @place = Place.find(params[:id])
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
    redirect_to root_path unless @place.user == current_user
    # debugger
    @place.destroy
    flash[:notice] = 'place was successfully deleted.'
    redirect_to root_path, status: :see_other
  end

  # def destroy
  #   @place = Place.find(params[:id])
  #   redirect_to place_path(@place), status: :see_other
  # end

  private

  def place_params
    params.require(:place).permit(:name, :country, :address, :description, :photo)
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
