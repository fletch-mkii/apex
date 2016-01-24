class Planet < ActiveRecord::Base

  UNITS = [
    "Kelvin",
    "Days",
    "",
    "Juper Masses",
    "Jupiter Radii",
    "Grams per cubic centimeter",
  ]

  belongs_to :star

  validates :planet_name, presence: true, uniqueness: true

  def transits?
    return "This planet transits its host star." if transits
    return "This planet does not transit its host star."
  end
end
