class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    geocoder = Geocoder.search(@user.current_sign_in_ip)
    @user.current_location = geocoder.first.address
    @star = @user.find_star

    if @user.save
      unless @user.stars.include?(@star)
        if @user.current_location.nil?
          @user.histories.create(star_id: @star.id, observation_location: "")
        else
          @user.histories.create(star_id: @star.id, observation_location: @user.current_location)
        end
      end
      flash.notice = "Star successfully found!"
      redirect_to star_path(@star)
    else
      flash.notice = @user.errors.full_messages.join(". ")
      render root_path
    end
  end
end
