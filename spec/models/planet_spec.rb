require 'rails_helper'

describe Planet do

  it { should belong_to :star }

  describe "validation checks for star_name" do
    subject { FactoryGirl.build(:planet) }
    it { should validate_presence_of(:planet_name) }
  end
end
