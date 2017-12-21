class Users::VotesController < ApplicationController

  before_action :authenticate_user!

  def create
    @vote = Vote.new
    @user = User.friendly.find(params[:id])
    @photo = Photo.find(params[:photo_id])
    @vote.photo_id = @photo.id
    @vote.producer_id = current_producer.id
    if @vote.save
      redirect_to user_path(@user)
      flash[:notice] = "You've successfully added a photo!"
    else
      render 'new'
      flash.now[:alert] = "You've failed!"
    end
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    current_user.unvote(@photo)
  end

end