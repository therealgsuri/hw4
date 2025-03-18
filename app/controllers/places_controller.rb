
class PlacesController < ApplicationController
  before_action :require_login, except: [:index]

  def index
    if @current_user
      @places = Place.where(user_id: @current_user.id)
    else
      @places = []
    end
  end

  def show
    @place = Place.find_by(id: params["id"])
    if @place.user_id != @current_user&.id
      redirect_to "/places"
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(
      name: params["name"],
      description: params["description"],
      user_id: @current_user.id
    )
    if @place.save
      redirect_to "/places"
    else
      render :new
    end
  end
end
