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
DAYS_PASSED_PER_MONTH.freeze

# days passed since J2000 epoch as of 00:00 01/01/16
DAYS_SINCE_J2000 = 5842.5

class User < ActiveRecord::Base

  geocoded_by :current_sign_in_ip
  after_validation :geocode

  has_many :histories
  has_many :stars, through: :histories

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true

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
      next if star.distance.nil?
      if star.distance < min_distance
        min_distance = star.distance
        @output_star = star
      end
    end
    @output_star
  end

  def hours
    time = Time.now.utc
    time.hour.to_f + (time.min.to_f / 60.0) + (time.sec.to_f / 3600.0)
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

  def current_global_sidereal
    ((18.697374558 + 24.06570982441908 * current_j2000_date) % 24) * 15
  end

  def current_right_ascension
    raw_sidereal = current_global_sidereal + (longitude)

    if raw_sidereal >= 360.0
      return raw_sidereal - 360
    elsif raw_sidereal < 0
      return raw_sidereal + 360
    else
      return raw_sidereal
    end
  end

  def current_declination
    latitude
  end
end
