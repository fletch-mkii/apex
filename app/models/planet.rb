class Planet < ActiveRecord::Base

  UNITS = [
    "Kelvin",
    "Days",
    "",
    "Juper Masses",
    "Jupiter Radii",
    "g/cm³",
    "",
  ]

  ATTRIBUTE_INFO = {
    planettemperature: "This is the absolute surface temperature of the planet,
                        measured in Kelvin.  Kelvin scales identically to degrees
                        celsius, and 273.15 Kelvin is equivalent to zero degrees
                        Celsius.  The surface temperature of a planet is much more
                        difficult to calculate than a star's because of the
                        differential in brightness between the two objects.  Usually
                        a star emits too much light for a planet's blackbody spectra
                        to be noticeable from Earth.",
    planetorbitalperiod: "Orbital period is the amount of time, in days, that it
                          takes for the planet to fully orbit its parent star.  Earth's
                          orbital period is roughly 365 days, Mars' is about 687 days,
                          Mercury's is close to 88 days, and eveybody's favorite
                          dwarf planet Pluto has an oribtal period of over
                          90,000 days!",
    planetorbitaleccentricity: "A planet's orbital eccenticity is a measure of
                                how elliptical it's orbit is.  An eccentricity
                                close to zero would mean a near-circular orbit,
                                whereas one further from zero would be very elliptical
                                in shape.  No astronomical objects orbit their parent
                                body in a perfect circle.  An eccentricity greater
                                than 1 would mean the object has reached escape
                                velocity and would not permanently orbit it's parent.
                                Some comets have an eccentricity greater than 1.",
    planetmass: "The amount of matter contained within the planet.  The mass of
                a planet can only be calculated when the mass of its parent star
                is also known.  It seems like a planet is orbiting a stationary
                star, but in reality both objects are orbiting their system's
                center of mass somewhere between the two.  This property allows
                the mass of orbiting bodies to be calculated by observing the
                doppler shift of the star.  The caveat with this method is that
                it is only reliable for system's with one planet.  This is
                because the total mass of the system can be found as well as the
                mass of the star.  The difference between these two is then simple
                to find, but if there are two planets then you're simply left with
                their combined mass and no knowledge of any planet's individual mass.",
    planetradius: "The radius of a planet is the distance from the center to the
                  surface.  This is easy to calculate for planets that transit
                  their parent star, but difficult in other cases.  When a planet
                  transits its parent star, it blocks out some of the light from
                  the star.  This allows scientists to calculate the difference
                  in luminosity between the two states, and the area of the blocked
                  out section can then be deciphered.  This area is the same as
                  the area of the planet, and so the radius can be calculated using
                  simple arithmetic.",
    planetdensity: "The density of a planet is how much mass is contained in a
                    given volume.  This value is trivially calculated if the mass
                    and radius are known, but is otherwise fairly impossible to
                    figure out.",
    planetdiscoverymethod: "There are three main methods for discovering exoplanets.
                            Radial Velocity is one such method.  This method utilizes
                            the characteristic of orbiting bodies to orbit the
                            center of mass of the entire system, and not simply
                            the largest object in the system.  This means that
                            the motion of the star causes a doppler shift to occur,
                            and the severity of the shift can be used to calculate
                            the mass of the remaining orbiting bodies using a known
                            stellar mass.  The Transit Method is another method
                            for identifying exoplanets.  When a planet passes
                            in front of a star, some of the light (and energy) is
                            blocked from our view.  This drop in brightness allows
                            the area of the planet to be calculated, because it is
                            the same as the area of light that is blocked out.  this
                            method is very reliable, but limited in that it only
                            works for planets that actually orbit between Earth and
                            its parent star.  The final of the core methods is simple:
                            Direct Imaging.  This method is successful much less often
                            than the previous two, but occasionally a planet can
                            be identified directly from a telescope.  Usually the
                            light of a parent star makes this impossible, but in
                            some cases the planet might be far enough away from
                            the star to be noticed.  There are other, less common,
                            methods as well.  Three more methods are the Timing Method,
                            the Astrometry Method, and the Gravitational Lensing Method.",
  }

  belongs_to :star

  validates :planet_name, presence: true, uniqueness: true
  validates :star_id, presence: true

  def transits?
    return "This planet transits its parent star." if transits
    return "This planet does not transit its parent star."
  end
end
