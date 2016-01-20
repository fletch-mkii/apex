class StarsController < ApplicationController

  def show
    @star = Star.find(params[:id])
  end
end
