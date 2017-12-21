class Users::VotesController < ApplicationController

  before_action :authenticate_user!

  def create
    @vote = Vote.new
    @photo = Photo.friendly.find(params[:photo_id])
    @vote.photo_id = @photo.id
    @vote.user_id = current_user.id
    if @vote.save
      redirect_to user_path(@photo.user)
      flash[:notice] = "You've successfully added a photo!"
    else
      render 'new'
      flash.now[:alert] = "You've failed!"
    end
  end

  def destroy
    @photo = Photo.friendly.find(params[:photo_id])
    current_user.unvote(@photo)
    redirect_to user_path(@photo.user)
  end

end