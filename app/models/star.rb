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
    star_name: "Many stars have multiple names, but the name represented
              here is the name referenced most often in publications.  New stars
              are generally named after either their discoverer, or the
              telescope with which they were found.  Other stars have been
              named for centuries, and follow the trends of the society that
              named them.  This resulted in a fair portion of stars possessing
              names from the mythologies of various cultures.",
    right_ascension: "Right ascension is the name for one of the coordinates in the
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
    stellar_age: "The age of a star seems like it might be challenging to calculate,
                but only two values are needed in order to make a good estimate
                for a main sequence star: mass and luminosity.  As a star ages,
                it will become more luminous.",
    stellar_mass: "The amount of matter contained within the star.  This can be
                  easily calculated given the brightness of a star and the distance
                  that star is away from Earth.  This allows for absolute brightness
                  to be calculated.  The brightness of a star correlates directly
                  with mass, so once absolute brightness is known the mass can be
                  trivially calculated.",
    stellar_radius: "Radius is the distance from the center of a star to the surface.
                    The radius is a star can be calculated realiably if the
                    luminosity of that star is known.  Luminosity can typically
                    be calculated for a star with observable brightness, which allows radius to
                    also be found easily.  Luminosity is dependent upon surface area,
                    and radius is tied directly to the radius of a star.  This means
                    that a known luminosity allows radius to be deciphered trivially.",
    spectral_type: "Most stars are currently classified under the Morgan–Keenan
                    (MK) system using the letters O, B, A, F, G, K, and M, a sequence
                    from the hottest (O type) to the coolest (M type). Each letter
                    class is then subdivided using a numeric digit with 0 being
                    hottest and 9 being coolest. There are additonal classes, such as
                    D for white dwarfs and class C for carbon stars. A luminosity
                    class is added to the spectral class using Roman numerals.
                    This is based on the width of certain absorption lines in the star's spectrum,
                    which vary with the density of the atmosphere and so distinguish giant stars from
                    dwarfs. The full spectral class for the Sun is G2V.",
    density: "Density is the ratio of a star's mass to it's volume.  Volume can be
              calculated if radius is known because stars are spherical.  Therefore
              density is known for any star where a radius and mass are known.",
    luminosity: "A star's luminosity is the total amount of energy emitted by it
                per unit time, also known as energy flux. It is tied directly to
                brightness, meaning a star with higher luminosity is also brighter.
                A star's luminosity can be determined as long as size and temperature
                are known. In SI units luminosity is measured in joules per second
                or watts. Values for luminosity are often given in the terms of
                the luminosity of the Sun, which has a total power output of about
                384 YottaWatts.  That's fifteen orders of magnitude larger than a
                GigaWatt!",
    surface_gravity: "The surface gravity of a star is the gravitational acceleration
                      experienced at its surface, and is dependent only upon mass
                      and radius.  Mass determines gravity, and the distance away
                      from the center of mass determines the acceleration due to gravity
                      from that object.  The gravitational acceleration on the surface
                      of Earth is roughly 9.8 m/s."
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
