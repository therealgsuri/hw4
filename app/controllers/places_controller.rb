
class PlacesController < ApplicationController
  before_action :require_login

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @current_user.id })
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

  private

  def require_login
    if @current_user.nil?
      redirect_to "/sessions/new"
    end
  end
end
