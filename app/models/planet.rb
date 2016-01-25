class Planet < ActiveRecord::Base

  UNITS = [
    "Kelvin",
    "Days",
    "",
    "Juper Masses",
    "Jupiter Radii",
    "Grams per cubic centimeter",
    "",
    "Log10 of cm/s^2"
  ]

  ATTRIBUTE_INFO = {
    planettemperature: "planet surface temperature info",
    planetorbitalperiod: "orbital period info",
    planetorbitaleccentricity: "planet orbital eccentricity info",
    planetmass: "planet mass info",
    planetradius: "planet radiu info",
    planetdensity: "planet density info",
    surfacegravity: "gravity info",
    planetdiscoverymethod: "discovery info",
  }

  belongs_to :star

  validates :planet_name, presence: true, uniqueness: true

  def transits?
    return "This planet transits its host star." if transits
    return "This planet does not transit its host star."
  end
end
