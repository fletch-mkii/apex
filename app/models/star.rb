class Star < ActiveRecord::Base

  UNITS = [
    "",
    "°",
    "°",
    "Parsecs",
    "Kelvin",
    "Gigayears",
    "Solar Masses",
    "Solar Radii",
    "",
    "Grams per cubic centimeter",
    "Solar Luminosities"
  ]

  ATTRIBUTE_INFO = {
    starname: "star name info",
    rightascension: "RA info",
    declination: "dec info",
    distance: "dist info",
    temperature: "temp info",
    stellarage: "age info",
    stellarmass: "mass info",
    strellarradius: "radius info",
    spectraltype: "spectype info",
    density: "density info",
    luminosity: "luminosity info"
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
  end

  def parsecs_to_kilometers
    #make converter for each attribute???
    #still requires constant array of base units???
  end

end
