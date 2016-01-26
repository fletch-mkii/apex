require "httpclient"
require "json"

# days counted from 00:00 of the first of every month
DAYS_PASSED_PER_MONTH = {
  "1" => { normal: 0, leap: 0 },
  "2" => { normal: 31, leap: 31 },
  "3" => { normal: 59, leap: 60 },
  "4" => { normal: 90, leap: 91 },
  "5" => { normal: 120, leap: 121 },
  "6" => { normal: 151, leap: 152 },
  "7" => { normal: 181, leap: 182 },
  "8" => { normal: 212, leap: 213 },
  "9" => { normal: 243, leap: 244 },
  "10" => { normal: 273, leap: 274 },
  "11" => { normal: 304, leap: 305 },
  "12" => { normal: 334, leap: 335 }
}
DAYS_PASSED_PER_MONTH.freeze # hound???

# days passed since J2000 epoch as of 00:00 01/01/16
DAYS_SINCE_J2000 = 5842.5

class User < ActiveRecord::Base

  has_many :histories
  has_many :stars, through: :histories

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true

  def set_location(ip)
    response = HTTPClient.new.get("http://freegeoip.net/json/#{ip}")
    json_response = JSON.parse(response.body)

    self.latitude = json_response["latitude"]
    self.longitude = json_response["longitude"]

    return "#{json_response["city"]}, #{json_response["region_name"]}"
  end

  def find_star
    star_search(1.0)
  end

  private

  def star_search(range)
    stars = Star.where(
      declination: (current_declination - range)..(current_declination + range),
      right_ascension: (current_right_ascension - range)..(current_right_ascension + range)
    )
    if stars.empty?
      return star_search(range + 1.0)
    elsif stars.count == 1
      return stars.first
    else
      return closest_star(stars)
    end
  end

  def closest_star(stars)
    min_distance = 100_000
    stars.each do |star|
      min_distance = star.distance if star.distance < min_distance
    end
    stars.each do |star|
      return star if star.distance == min_distance
    end
  end

  def hours
    time = Time.now.utc
    time.hour.to_f + (time.min.to_f / 60.0) + (time.sec.to_f / 3600.0)
  end

  def current_local_hour_angle
    15.0 * hours
  end

  def current_j2000_date
    time = Time.now.utc
    year_type = :leap
    year_type = :normal unless time.year % 4 == 0
    year_tracker = time.year.to_f - 2016.0

    jdays = DAYS_SINCE_J2000 + 365.0 * year_tracker + (year_tracker / 4.0).to_i
    jdays += DAYS_PASSED_PER_MONTH[time.month.to_s][year_type].to_f
    jdays += time.day + hours / 24.0
  end

  def current_local_sidereal
    sidereal = current_local_hour_angle + 100.46 + longitude
    sidereal += 0.9885647 * current_j2000_date
    sidereal % 360
    # sidereal = current_local_hour_angle + 100.46 + self.longitude + 0.0034557123449953306 * current_j2000_date
    # sidereal = 18.697374558 + self.longitude + 24.06570982441908 * current_j2000_date
    # GMST = 18.697374558 + 24.06570982441908 D
  end

  def current_right_ascension
    ra = (current_local_hour_angle - current_local_sidereal) * -1
    return ra if ra > 0
    ra + 360
  end

  def current_declination
    latitude
  end
end
