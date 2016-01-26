class HomesController < ApplicationController #; layout false
  def index
    @star = Star.all.sample
  end
end
