# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
require "httpclient"
require "csv"

# 10.times do |i|
#   User.create(email: "test#{i}@email.com", password: "password#{i}")
# end

STAR_COLUMNS = ["pl_hostname","ra","dec","st_dist","st_teff","st_mass","st_rad","st_spstr","st_logg","st_lum","st_dens","st_age"]
PLANET_COLUMNS = ["pl_name","pl_tranflag","pl_eqt","pl_discmethod","pl_orbper","pl_orbeccen","pl_massj","pl_radj","pl_dens"]
exoplanets_base_query = "http://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=exoplanets"
query = "&columns=" + STAR_COLUMNS.join(",") + "," + PLANET_COLUMNS.join(",")
response = HTTPClient.new.get(exoplanets_base_query + query)
csv = CSV.new(response.body, :headers => true, :header_converters => :symbol, :converters => :all)
csv_array_of_hashes = csv.to_a.map {|row| row.to_hash }

csv_array_of_hashes.each do |planet|
  if planet[:pl_tranflag] == 0
    planet_tranflag = false
  elsif planet[:pl_tranflag] == 1
    planet_tranflag = true
  else
    planet_tranflag = nil
  end

  star = Star.create(
    star_name: planet[:pl_hostname],
    right_ascension: planet[:ra],
    declination: planet[:dec],
    distance: planet[:st_dist],
    temperature: planet[:st_teff],
    stellar_age: planet[:st_age],
    stellar_mass: planet[:st_mass],
    stellar_radius: planet[:st_rad],
    spectral_type: planet[:st_spstr],
    density: planet[:st_dens],
    surface_gravity: planet[:st_logg],
    luminosity: planet[:st_lum],
  )

  star = Star.where("star_name = ?", planet[:pl_hostname]).first if star.id.nil?

  Planet.create(
    planet_name: planet[:pl_name],
    temperature: planet[:pl_eqt],
    orbital_period: planet[:pl_orbper],
    orbital_eccentricity: planet[:pl_orbeccen],
    mass: planet[:pl_massj],
    radius: planet[:pl_radj],
    density: planet[:pl_dens],
    discovery_method: planet[:pl_discmethod],
    transits: planet[:pl_tranflag],
    star_id: star.id
  )
end
