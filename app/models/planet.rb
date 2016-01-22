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


#PLANETARY INFO#
#pl_name - most commonly used planet name
#pl_tranflag - indicator of if the planet ever transits the star (1 for yes, 0 for no)
#pl_eqt - planet equilibrium temperature modeled by a blackbody, in KELVINS
#pl_letter - letter for the planet (when appended to star name is planet name)
#pl_pnum - number of planets in the system
#pl_discmethod - discovery method for planet
#pl_orbper - orbital period for planet in DAYS
#pl_orbeccen - eccentricity of a planet's orbit
#pl_bmassj - best measurement of planetary mass, in units of JUPITER MASS (not sure of difference between massj)
#pl_massj - amount of matter contained in the planet, in units of JUPITER MASS (not sure of difference between bmassj)
#pl_radj - planet radius (center to surface) in units of JUPITER RADII
#pl_dens - planet density in GRAMS PER CUBIC CENTIMETER (g/cm^3)
