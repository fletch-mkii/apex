require 'rails_helper'

describe User do

  it { should have_many :stars }

  describe "validation checks for email" do
    subject { FactoryGirl.build(:user) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:email) }
    it { should allow_value('test@example.com').for(:email) }
    it { should_not allow_value('test@example').for(:email) }
    it { should_not allow_value('example.com').for(:email) }
  end

  describe "validation checks for username" do
    subject { FactoryGirl.build(:user) }
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  describe "validation checks for password" do
    subject { FactoryGirl.build(:user) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password) }
  end
end
