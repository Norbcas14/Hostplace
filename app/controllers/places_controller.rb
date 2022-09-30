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
    @place.save
    # No need for app/views/restaurants/create.html.erb
    redirect_to article_path(@place)
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
