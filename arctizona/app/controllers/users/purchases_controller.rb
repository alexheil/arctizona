class Users::PurchasesController < ApplicationController

  def create
    @user = User.friendly.find(params[:user_id])
    @photo = Photo.friendly.find(params[:photo_id])
    @purchase = @photo.purchases.build(purchase_params)

    @purchase.buyer_id = current_user.id
    @purchase.seller_id = @user.id
  end

  private 

    def purchase_params
    end

end