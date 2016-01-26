require 'rails_helper'

describe Planet do

  it { should belong_to :star }

  describe "validation checks for planet_name" do
    subject { FactoryGirl.build(:planet) }
    it { should validate_presence_of(:planet_name) }
  end

  describe "validation checks for star_id" do
    subject { FactoryGirl.build(:planet) }
    it { should validate_presence_of(:star_id) }
  end

  describe "transits? method" do
    it "should return affirmative message" do
      tplanet = Planet.create(planet_name: "transitworld", star_id: 1, transits: true)
      expect(tplanet.transits?).to eq("This planet transits its host star.")
    end

    it "should return affirmative message" do
      ntplanet = Planet.create(planet_name: "transitworld", star_id: 2, transits: false)
      expect(ntplanet.transits?).to eq("This planet does not transit its host star.")
    end
  end
end
