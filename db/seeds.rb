# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
require "httpclient"
require "csv"

# 10.times do |i|
#   User.create(email: "test#{i}@email.com", password: "password#{i}")
# end

STAR_COLUMNS = ["pl_hostname","ra","dec","st_dist","st_teff","st_mass","st_rad","st_spstr","st_logg","st_lum","st_dens","st_age"]
exoplanets_base_query = "http://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=exoplanets"
star_query = "&columns=" + STAR_COLUMNS.join(",")
star_response = HTTPClient.new.get(exoplanets_base_query + star_query)
csv = CSV.new(star_response.body, :headers => true, :header_converters => :symbol, :converters => :all)
csv_array_of_hashes = csv.to_a.map {|row| row.to_hash }

csv_array_of_hashes.each do |star|
  Star.create(
    star_name: star[:pl_hostname],
    right_ascension: star[:ra],
    declination: star[:dec],
    distance: star[:st_dist],
    temperature: star[:st_teff],
    stellar_age: star[:st_age],
    stellar_mass: star[:st_mass],
    stellar_radius: star[:st_rad],
    spectral_type: star[:st_spstr],
    density: star[:st_dens],
    surface_gravity: star[:st_logg],
    luminosity: star[:st_lum],
    )
end
