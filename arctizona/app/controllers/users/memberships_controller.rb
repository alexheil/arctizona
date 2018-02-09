class Users::MembershipsController < ApplicationController

  before_action :set_user

  def new
    @membership = @user.build_membership
  end

  def create
    @membership = @user.create_membership(membership_params)
    if @membership.save
      redirect_to user_path(@user)
      flash[:notice] = "You've successfully added a photo album!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_user
      @user = current_user
    end

    def membership_params
      params.require(:membership).permit(:member, :bronze, :silver, :gold, :platinum, :membership_type, :amount, :percent)
    end

end