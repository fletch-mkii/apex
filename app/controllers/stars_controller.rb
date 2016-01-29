class StarsController < ApplicationController

  def show
    @custom_bg = true
    @star_units = Star::UNITS
    @planet_units = Planet::UNITS
    @star = Star.find(params[:id])
    @planets = @star.planets
  end
end
