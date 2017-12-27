class Users::UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @profile = current_user.profile
    @location = current_user.location
    @theme = current_user.theme
  end
  
end