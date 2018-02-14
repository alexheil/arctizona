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
      params.require(:purchase).permit(:buyer_id, :seller_id, :stripe_charge_id, :quantity, :pay_your_own_price, :complete_price, :full_name, :street_address, :city, :state, :country, :zip_code, :is_shipped)
    end

end