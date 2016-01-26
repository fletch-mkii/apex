class Star < ActiveRecord::Base

  UNITS = [
    "",
    "°",
    "°",
    "Parsecs",
    "Kelvin",
    "Billion years",
    "Solar Masses",
    "Solar Radii",
    "",
    "g/cm³",
    "Solar Luminosities",
    "m/s²"
  ]

  ATTRIBUTE_INFO = {
    starname: "Many stars have multiple names, but the name represented
              here is the name referenced most often in publications.  New stars
              are generally named after either their discoverer, or the
              telescope with which they were found.  Other stars have been
              named for centuries, and follow the trends of the society that
              named them.  This resulted in a fair portion of stars possessing
              names from the mythologies of various cultures.",
    rightascension: "Right ascension is the name for one of the coordinates in the
                    celestial coordinate system.  It is akin to the longitude
                    of earth's coordinates, in that it runs perpendicular to the
                    celestial equator.  Declination can be measured in units of
                    time (hours, minutes, seconds), or in degrees.",
    declination: "Declination is the name for one of the coordinates in the
                  celestial coordinate system.  It is akin to the latitude
                  of earth's coordinates, in that it runs parallel to the
                  celestial equator.  Declination is measured in degrees with a
                  value of zero at the celestial equator, positive ninety degrees
                  at the celestial north pole, and negative ninety degrees at the
                  celestial south pole",
    distance: "Distance represents how far the planetary system that hosts this
              star is from earth.  This distance is measured in parsecs, where a
              parsec is roughly equivalent to 30,860,000,000,000 kilometers, or
              3.25 light years.  The distance between the Earth and the Sun is
              about 0.000004848 parsecs, so visitng this system would be quite
              the trip!",
    temperature: "This is the absolute surface temperature of the star, measured
                  in Kelvin.  Kelvin scales identically to degrees celsius, so at
                  high tempertures one is a fair estimate for the other.  The
                  surface temperature of a star is calculated by studying the
                  light spectra that the star emits, and finding the wavelength
                  of light that the star emits most frequently.  Temperature
                  correlates to exact wavelengths of light, so if one value is
                  known then the other can be found trivially via Wien's
                  Displacement Law.",
    stellarage: "The age of a star seems like it might be challenging to calculate,
                but only two values are needed in order to make a good estimate
                for a main sequence star: mass and luminosity.  As a star ages,
                it will become more luminous.",
    stellarmass: "The amount of matter contained within the star.  This can be
                  easily calculated given the brightness of a star and the distance
                  that star is away from Earth.  This allows for absolute brightness
                  to be calculated.  The brightness of a star correlates directly
                  with mass, so once absolute brightness is known the mass can be
                  trivially calculated.",
    stellarradius: "radius info",
    spectraltype: "spectype info",
    density: "density info",
    luminosity: "luminosity info",
    surfacegravity: "gravity info"
  }

  has_many :planets
  has_many :histories
  has_many :users, through: :histories

  validates :star_name, presence: true, uniqueness: true
  validates :right_ascension, presence: true, numericality: true
  validates :declination, presence: true, numericality: true


  def convert_units
    #takes in attributes
    #converts to more understandable units
    #outputs readable string for user
    #make converter for each attribute???
    #still requires constant array of base units???
  end
end
