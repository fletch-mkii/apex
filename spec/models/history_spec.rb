require 'rails_helper'

describe History do

  it { should belong_to :user }
  it { should belong_to :star }

  describe "validation checks for star_id" do
    subject { FactoryGirl.build(:history) }
    it { should validate_presence_of(:star_id) }
  end

  describe "validation checks for user_id" do
    subject { FactoryGirl.build(:history) }
    it { should validate_presence_of(:user_id) }
  end

  describe "validation checks for observation_location" do
    subject { FactoryGirl.build(:history) }
    it { should validate_presence_of(:observation_location) }
  end
end
