class Users::MembershipsController < ApplicationController

  before_action :set_user

  def new
    @membership = Membership.new
  end

  def create
    @user.create_membership(membership_params)
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