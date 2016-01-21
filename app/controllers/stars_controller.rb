class StarsController < ApplicationController

  UNITS = [
    "",
    "°",
    "°",
    " Parsecs",
    " Kelvin",
    " Gigayears",
    " Solar Masses",
    " Solar Radii",
    "",
    " Grams per cubic centimeter",
    " Log10 of cm/s^2",
    " Solar Luminosities"
  ]

  def show
    binding.pry
    @units = UNITS
    @star = Star.find(params[:id])
  end
end


  ##api parsing to save for later.  Incomplete.
  # def get_celestial
  #   STAR_COLUMNS = ["pl_hostname","ra","dec","st_dist","st_teff","st_mass","st_rad","st_spstr","st_logg","st_lum","st_dens","st_age"]
  #   exoplanets_base_query = "http://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=exoplanets"
  #   star_query = "&columns=" + STAR_COLUMNS.join(",")
  #   star_response = HTTPClient.new.get(exoplanets_base_query + star_query)
  #   # PLANET_COLUMNS = ["pl_name"]
  #   # planet_query = "&columns=" + planet_columns.join(",")
  #   # planet_response = HTTPClient.new.get(exoplanets_base_query + planet_query)
  # #   array_of_arrays = CSV.parse(response)
  # end
  #####
  #OVERALL INFO#
  #rowupdate - date that the information was last updated
  #STAR INFO#
  #MIGRATED#pl_hostname - star name
  #MIGRATED#ra - right ascension of the system in DECIMAL DEGREES (ra_str is for sexagesimal format))
  #MIGRATED#dec - declination of the system in DECIMAL DEGREES (dec_str is for sexagesimal format)
  #MIGRATED#st_dist - distance to the system in PARSECS
  #st_optmag - brightness of host star measured using V (Johnson) or Kepler-band in units of magnitude (not sure here)
  #MIGRATED#st_teff - Effective temperature of the host star as modeled by a black body in KELVINS
  #MIGRATED#st_mass - Stellar Mass in units of SOLAR MASS
  #MIGRATED#st_rad - Stellar Radius in units of SOLAR RADII
  #MIGRATED#st_spstr - Spectral Type following the Morgan-Keenan system
  #MIGRATED#st_logg - Stellar Surface Gravity, acceleration at surface (no units, probably log10 of cm/s^2???)
  #MIGRATED#st_lum - Stellar Luminosity, Energy emitted by star in units of solar luminosities (log(solar)???)
  #MIGRATED#st-dens - Stellar Density in g/cm^3
  #st_metfe - Stellar Metallicity (read again for units and understanding)
  #MIGRATED#st_age - Stellar Age in Gyr (gigayears)
  #st_nimg - number of images of the star in the archive (other things like spectra also available)

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
