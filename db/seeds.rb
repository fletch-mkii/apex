# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
require "httpclient"
require "csv"

CITIES = [
	 ',New York, New York',
	'Los Angeles, California',
	'Chicago, Illinois',
	'Houston, Texas',
	'Philadelphia, Pennsylvania',
	'Phoenix, Arizona',
	'San Antonio, Texas',
	'San Diego, California',
	'Dallas, Texas',
	'San Jose, California',
	'Jacksonville, Florida',
	'Indianapolis, Indiana',
	'San Francisco, California',
	'Austin, Texas',
	'Columbus, Ohio',
	'Fort Worth, Texas',
	'Charlotte, North Carolina',
	'Detroit, Michigan',
	'El Paso, Texas',
	'Memphis, Tennessee',
	'Baltimore, Maryland',
	'Boston, Massachusetts',
	'Seattle, Washington',
	'Washington, District of Columbia',
	'Nashville, Tennessee',
	'Denver, Colorado',
	'Louisville, Kentucky',
	'Milwaukee, Wisconsin',
	'Portland, Oregon',
	'Las Vegas, Nevada',
	'Oklahoma City, Oklahoma',
	'Albuquerque, New Mexico',
	'Tucson, Arizona',
	'Fresno, California',
	'Sacramento, California',
	'Long Beach, California',
	'Kansas City, Missouri',
	'Mesa, Arizona',
	'Virginia Beach, Virginia',
	'Atlanta, Georgia',
	'Colorado Springs, Colorado',
	'Omaha, Nebraska',
	'Raleigh, North Carolina',
	'Miami, Florida',
	'Cleveland, Ohio',
	'Tulsa, Oklahoma',
	'Oakland, California',
	'Minneapolis, Minnesota',
	'Wichita, Kansas',
	'Arlington, Texas',
	'Bakersfield, California',
	'New Orleans, Louisiana',
	'Honolulu, Hawaii',
	'Anaheim, California',
	'Tampa, Florida',
	'Aurora, Colorado',
	'Santa Ana, California',
	'Saint Louis, Missouri',
	'Pittsburgh, Pennsylvania',
	'Corpus Christi, Texas',
	'Riverside, California',
	'Cincinnati, Ohio',
	'Lexington, Kentucky',
	'Anchorage, Alaska',
	'Stockton, California',
	'Toledo, Ohio',
	'Saint Paul, Minnesota',
	'Newark, New Jersey',
	'Greensboro, North Carolina',
	'Buffalo, New York',
	'Plano, Texas',
	'Lincoln, Nebraska',
	'Henderson, Nevada',
	'Fort Wayne, Indiana',
	'Jersey City, New Jersey',
	'Saint Petersburg, Florida',
	'Chula Vista, California',
	'Norfolk, Virginia',
	'Orlando, Florida',
	'Chandler, Arizona',
	'Laredo, Texas',
	'Madison, Wisconsin',
	'Winston-Salem, North Carolina',
	'Lubbock, Texas',
	'Baton Rouge, Louisiana',
	'Durham, North Carolina',
	'Garland, Texas',
	'Glendale, Arizona',
	'Reno, Nevada',
	'Hialeah, Florida',
	'Chesapeake, Virginia',
	'Scottsdale, Arizona',
	'North Las Vegas, Nevada',
	'Irving, Texas',
	'Fremont, California',
	'Irvine, California',
	'Birmingham, Alabama',
	'Rochester, New York',
	'San Bernardino, California',
	'Spokane, Washington',
	'Gilbert, Arizona',
	'Arlington, Virginia',
	'Montgomery, Alabama',
	'Boise, Idaho',
	'Richmond, Virginia',
	'Des Moines, Iowa',
	'Modesto, California',
	'Fayetteville, North Carolina',
	'Shreveport, Louisiana',
	'Akron, Ohio',
	'Tacoma, Washington',
	'Aurora, Illinois',
	'Oxnard, California',
	'Fontana, California',
	'Yonkers, New York',
	'Augusta, Georgia',
	'Mobile, Alabama',
	'Little Rock, Arkansas',
	'Moreno Valley, California',
	'Glendale, California',
	'Amarillo, Texas',
	'Huntington Beach, California',
	'Columbus, Georgia',
	'Grand Rapids, Michigan',
	'Salt Lake City, Utah',
	'Tallahassee, Florida',
	'Worcester, Massachusetts',
	'Newport News, Virginia',
	'Huntsville, Alabama',
	'Knoxville, Tennessee',
	'Providence, Rhode Island',
	'Santa Clarita, California',
	'Grand Prairie, Texas',
	'Brownsville, Texas',
	'Jackson, Mississippi',
	'Overland Park, Kansas',
	'Garden Grove, California',
	'Santa Rosa, California',
	'Chattanooga, Tennessee',
	'Oceanside, California',
	'Fort Lauderdale, Florida',
	'Rancho Cucamonga, California',
	'Port Saint Lucie, Florida',
	'Ontario, California',
	'Vancouver, Washington',
	'Tempe, Arizona',
	'Springfield, Missouri',
	'Lancaster, California',
	'Eugene, Oregon',
	'Pembroke Pines, Florida',
	'Salem, Oregon',
	'Cape Coral, Florida',
	'Peoria, Arizona',
	'Sioux Falls, South Dakota',
	'Springfield, Massachusetts',
	'Elk Grove, California',
	'Rockford, Illinois',
	'Palmdale, California',
	'Corona, California',
	'Salinas, California',
	'Pomona, California',
	'Pasadena, Texas',
	'Joliet, Illinois',
	'Paterson, New Jersey',
	'Kansas City, Kansas',
	'Torrance, California',
	'Syracuse, New York',
	'Bridgeport, Connecticut',
	'Hayward, California',
	'Fort Collins, Colorado',
	'Escondido, California',
	'Lakewood, Colorado',
	'Naperville, Illinois',
	'Dayton, Ohio',
	'Hollywood, Florida',
	'Sunnyvale, California',
	'Alexandria, Virginia',
	'Mesquite, Texas',
	'Hampton, Virginia',
	'Pasadena, California',
	'Orange, California',
	'Savannah, Georgia',
	'Cary, North Carolina',
	'Fullerton, California',
	'Warren, Michigan',
	'Clarksville, Tennessee',
	'McKinney, Texas',
	'McAllen, Texas',
	'New Haven, Connecticut',
	'Sterling Heights, Michigan',
	'West Valley City, Utah',
	'Columbia, South Carolina',
	'Killeen, Texas',
	'Topeka, Kansas',
	'Thousand Oaks, California',
	'Cedar Rapids, Iowa',
	'Olathe, Kansas',
	'Elizabeth, New Jersey',
	'Waco, Texas',
	'Hartford, Connecticut',
	'Visalia, California',
	'Gainesville, Florida',
	'Simi Valley, California',
	'Stamford, Connecticut',
	'Bellevue, Washington',
	'Concord, California',
	'Miramar, Florida',
	'Coral Springs, Florida',
	'Lafayette, Louisiana',
	'Charleston, South Carolina',
	'Carrollton, Texas',
	'Roseville, California',
	'Thornton, Colorado',
	'Beaumont, Texas',
	'Allentown, Pennsylvania',
	'Surprise, Arizona',
	'Evansville, Indiana',
	'Abilene, Texas',
	'Frisco, Texas',
	'Independence, Missouri',
	'Santa Clara, California',
	'Springfield, Illinois',
	'Vallejo, California',
	'Victorville, California',
	'Athens, Georgia',
	'Peoria, Illinois',
	'Lansing, Michigan',
	'Ann Arbor, Michigan',
	'El Monte, California',
	'Denton, Texas',
	'Berkeley, California',
	'Provo, Utah',
	'Downey, California',
	'Midland, Texas',
	'Norman, Oklahoma',
	'Waterbury, Connecticut',
	'Costa Mesa, California',
	'Inglewood, California',
	'Manchester, New Hampshire',
	'Murfreesboro, Tennessee',
	'Columbia, Missouri',
	'Elgin, Illinois',
	'Clearwater, Florida',
	'Miami Gardens, Florida',
	'Rochester, Minnesota',
	'Pueblo, Colorado',
	'Lowell, Massachusetts',
	'Wilmington, North Carolina',
	'San Buenaventura (Ventura), California',
	'Arvada, Colorado',
	'Westminster, Colorado',
	'West Covina, California',
	'Gresham, Oregon',
	'Norwalk, California',
	'Fargo, North Dakota',
	'Carlsbad, California',
	'Fairfield, California',
	'Cambridge, Massachusetts',
	'Wichita Falls, Texas',
	'High Point, North Carolina',
	'Billings, Montana',
	'Green Bay, Wisconsin',
	'West Jordan, Utah',
	'Richmond, California',
	'Murrieta, California',
	'Burbank, California',
	'Palm Bay, Florida',
	'Everett, Washington',
	'Flint, Michigan',
	'Antioch, California',
	'Erie, Pennsylvania',
	'South Bend, Indiana',
	'Daly City, California',
	'Centennial, Colorado',
	'Temecula, California',
	]

STAR_COLUMNS = ["pl_hostname","ra","dec","st_dist","st_teff","st_mass","st_rad","st_spstr","st_lum","st_dens","st_age","st_logg"]
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

  #converts log10 of cm/s^2 to m/s^2
  st_logg = (10.0 ** planet[:st_logg].to_f / 10.0).round(2) unless planet[:st_logg].nil?

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
    luminosity: planet[:st_lum],
    surface_gravity: st_logg
  )

  star = Star.where("star_name = ?", planet[:pl_hostname]).first if star.id.nil?

  planet = Planet.create(
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

myself = User.create(username: "Mark Fletcher", email: "mark.fletcher@apex.io", password: "password")

used_cities = []
this_city = ""
Star.all.each do |star|
	while used_cities.include?(this_city) || this_city.empty?
    this_city = CITIES.sample
  end

	if (/\d/ =~ star.star_name).nil?
		History.create(user_id: myself.id, star_id: star.id, observation_location: this_city)
	  used_cities << this_city
	end
end
