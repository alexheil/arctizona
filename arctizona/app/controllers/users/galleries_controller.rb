class Users::GalleriesController < ApplicationController

  before_action :authenticate_user!, except: :show
  before_action :correct_user, only: :create
  before_action :correct_photo_album_user, only: :destroy
  before_action :set_user, except: :show

  def create
    @gallery = @user.create_gallery(gallery_params)
    if @gallery.save
      redirect_to user_path(@user)
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

    def correct_gallery_user
      @gallery = Gallery.friendly.find(params[:id])
      redirect_to user_path(@gallery.user_id) if @gallery.user_id != current_user.id
    end

    def gallery_params
      params.permit(:gallery)
    end

end