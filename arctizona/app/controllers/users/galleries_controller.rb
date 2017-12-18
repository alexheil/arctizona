class Users::GalleriesController < ApplicationController

  before_action :authenticate_artist!, except: :show
  before_action :correct_artist, only: :create
  before_action :correct_photo_album_artist, only: :destroy
  before_action :set_artist, except: :show

  def create
    @gallery = @user.create_gallery(gallery_params)
    if @gallery.save
      redirect_to artist_path(@artist)
      flash[:notice] = "You've successfully created a gallery!"
    else
      render 'new'
      flash.now[:alert] = "You've failed!"
    end
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

    def correct_photo_album_artist
      @gallery = Gallery.friendly.find(params[:id])
      redirect_to user_path(@gallery.user_id) if @gallery.user_id != current_user.id
    end

    def photo_album_params
      params.require(:gallery)
    end

end