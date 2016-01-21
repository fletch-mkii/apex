class Planet < ActiveRecord::Base

  belongs_to :star

  validates :planet_name, presence: true, uniqueness: true

  def transits?
    return transit unless transit.nil
    return "Unknown"
  end
end
