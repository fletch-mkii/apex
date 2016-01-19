require "httpclient"
require "json"

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

end
