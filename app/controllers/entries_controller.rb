class EntriesController < ApplicationController
  before_action :require_login

  def new
    @entry = Entry.new
    @place = Place.find_by(id: params["place_id"])
  end

  def create
    @entry = Entry.new(params["entry"])
    @entry.user_id = @current_user.id
    @entry.save
    redirect_to "/places/#{@entry.place_id}"
  end
end