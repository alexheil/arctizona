class Users::MembershipsController < ApplicationController

  before_action :set_user

  def edit
  end

  def update
  end

  private

    def set_user
      @user = current_user
    end

    def membership_params
      params.require(:membership).permit(:copper, :bronze, :silver, :gold, :platinum, :membership_type, :amount, :percent)
    end

end