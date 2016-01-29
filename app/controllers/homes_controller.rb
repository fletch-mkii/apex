class HomesController < ApplicationController #; layout false
  def index
    @custom_bg = true
    @star = Star.all.sample
  end
end
