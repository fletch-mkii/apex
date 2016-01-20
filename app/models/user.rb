require "httpclient"
require "json"

#days counted from 00:00 of the first of every month
DAYS_PASSED_PER_MONTH = {
  "1": { normal: 0, leap: 0 },
  "2": { normal: 31, leap: 31 },
  "3": { normal: 59, leap: 60 },
  "4": { normal: 90, leap: 91 },
  "5": { normal: 120, leap: 121 },
  "6": { normal: 151, leap: 152 },
  "7": { normal: 181, leap: 182 },
  "8": { normal: 212, leap: 213 },
  "9": { normal: 243, leap: 244 },
  "10": { normal: 273, leap: 274 },
  "11": { normal: 304, leap: 305 },
  "12": { normal: 334, leap: 335 }
}

#days passed since J2000 epoch as of 00:00 01/01/16
DAYS_SINCE_J2000 = 5842.5

class User < ActiveRecord::Base

  has_many :stars
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
  end

  def

  def find_star(dec, ra)
    dex = Star.find_by_sql("SELECT * FROM stars WHERE ROUND(CAST(declination as numeric), 1) = 39.3")
    binding.pry
  end

  private

  def hours
    time = Time.now.utc
    time.hour.to_f + (time.min.to_f / 60.0) + (time.sec.to_f / 3600.0)
  end

  def current_local_hour_angle ##currently 24 hour clock and 360 degrees max, should be 12 and 180???
    angle = 15.0 * hours       ## or maybe not?!?!?!
    if angle >= 0.0
      return angle
    else
      return angle + 360.0
    end
  end

  def current_j2000_date
    time = Time.now.utc
    year_type = :leap
    year_type = :normal unless time.year % 4 == 0
    year_tracker = time.year.to_f - 2016.0

    jdays = DAYS_SINCE_J2000 + 365.0 * year_tracker + (year_tracker / 4.0).to_i
    jdays += DAYS_PASSED_PER_MONTH[time.month.to_s][year_type].to_f
    # hours = time.hour.to_f + (time.min.to_f / 60.0) + (time.sec.to_f / 3600.0)
    jdays += hours / 24.0
  end

  def current_local_sidereal # modulus by 360 to get remainder beyond days passed???
    sidereal = current_local_hour_angle + 100.46 + self.longitude + 0.9885647 * current_j2000_date
    sidereal % 360.0
  end

  def current_right_ascension
    current_local_hour_angle - current_local_sidereal
  end

  def current_declination
    self.latitude
  end

end
