class StarsController < ApplicationController

  def show
    @user = current_user
    @user.find_star
    @star = Star.find(params[:id])
  end
end
