class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    ip = @user.current_sign_in_ip
    @user.set_location(ip)
    @star = @user.find_star

    if @user.save
      flash.notice = "Location successfully found."
      redirect_to star_path(@star)
    else
      flash.notice = user.errors.full_messages.join(". ")
      render root_path
    end
  end
end
