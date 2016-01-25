class HomesController < ApplicationController #; layout false
  def index
    flash.notice = "We testing shit boys"
  end
end
