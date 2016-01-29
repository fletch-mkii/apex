class UsersController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  def show
    @custom_bg = true
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    geocoder_data = Geocoder.search(@user.current_sign_in_ip).first.data
    @user.latitude = geocoder_data["latitude"]
    @user.longitude = geocoder_data["longitude"]

    location = geocoder_data["city"]
    unless geocoder_data["city"].empty?
      location += ", " + geocoder_data["region_name"]
    else
      location = geocoder_data["region_name"]
    end
    @user.current_location = location
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
