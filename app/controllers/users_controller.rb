
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    @user = User.new(username: params["username"], email: params["email"], password: params["password"])
    if @user.save
      session["user_id"] = @user.id
      redirect_to "/places"
    else
      render :new
    end
  end
end
