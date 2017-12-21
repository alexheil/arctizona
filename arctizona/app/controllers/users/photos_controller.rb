class Users::PhotosController < ApplicationController

  before_action :authenticate_user!, except: :show
  before_action :correct_user, only: :create
  before_action :correct_photo_user, only: :destroy
  before_action :set_user, except: :show

  def show
  end

  def new
  end

  def create
    @album = Album.friendly.find(params[:album_id])
    @photo = @album.photos.build(photo_params)
    @photo.user_id = @user.id
    if @photo.save
      redirect_to user_path(@user)
      flash[:notice] = "You've successfully added a photo!"
    else
      render 'new'
      flash.now[:alert] = "You've failed!"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    Photo.friendly.find(params[:id]).destroy
    redirect_to user_path(@user)
  end

  private

    def set_user
      @user = current_user
    end

    def correct_user
      @user = User.friendly.find(params[:user_id])
      if current_user != @user
        redirect_to user_path(@user)
        flash[:alert] = "This is not your profile."
      end
    end

    def correct_photo_user
      @photo = Photo.friendly.find(params[:id])
      redirect_to user_path(@photo.user_id) if @photo.user_id != current_user.id
    end

    def photo_params
      params.require(:photo).permit(:title, :image, :remove_image, :description, :camera, :lens, :aperture, :exposure, :flash, :focal_length, :iso)
    end

end