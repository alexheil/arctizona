class Users::UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @profile = current_user.profile
  end
  
end