require 'rails_helper'

describe Star do

  it { should have_many :planets }
  it { should have_many :users }

  describe "validation checks for star_name" do
    subject { FactoryGirl.build(:star) }
    it { should validate_presence_of(:star_name) }
    it { should validate_uniqueness_of(:star_name) }
  end

  describe "validation checks for right ascension" do
    subject { FactoryGirl.build(:star) }
    it { should validate_presence_of(:right_ascension) }
  end

  describe "validation checks for declination" do
    subject { FactoryGirl.build(:star) }
    it { should validate_presence_of(:declination) }
  end
end
