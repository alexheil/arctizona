class Users::PurchasesController < ApplicationController

  def create
    @user = User.friendly.find(params[:user_id])
    @album = Album.friendly.find(params[:album_id])
    @photo = Photo.friendly.find(params[:photo_id])
    @purchase = @photo.purchases.build(purchase_params)

    @purchase.buyer_id = current_user.id
    @purchase.seller_id = @user.id
    @purchase.complete_price = (@photo.total_price * @purchase.quantity) + @purchase.pay_your_own_price
  
    if @purchase.save
      redirect_to checkout_user_album_photo_purchase_path(@user, @album, @photo, @purchase)
      flash[:notice] = "how will you pay this?"
    else
      redirect_to artist_merch_path(@artist, @merch)
      flash.now[:alert] = "you have failed."
    end
  end

  def checkout
    @seller = User.friendly.find(params[:user_id])
    @album = Album.friendly.find(params[:album_id])
    @photo = Photo.friendly.find(params[:photo_id])
    @purchase = Purchase.find(params[:id])
    @buyer = current_user
  end

  private 

    def purchase_params
      params.require(:purchase).permit(:buyer_id, :seller_id, :stripe_charge_id, :quantity, :pay_your_own_price, :complete_price, :full_name, :street_address, :city, :state, :country, :zip_code, :is_shipped)
    end

end