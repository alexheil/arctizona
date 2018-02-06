class Users::MembershipsController < ApplicationController

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def membership_params
      params.require(:membership).permit(:member, :bronze, :silver, :gold, :platinum, :membership_type, :amount, :percent)
    end

end