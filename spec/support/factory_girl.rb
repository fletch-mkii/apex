FactoryGirl.find_definitions
include ApplicationHelper

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "testuser#{n}" }
    sequence(:email) { |n| "testemail#{n}@example.com" }
    sequence (:password) { |n| "password#{n}" }
  end

  factory :star do
    sequence(:star_name) { |n| "star#{n}" }
    sequence(:right_ascension) { |n| 10.0 + "0.#{n}".to_f  }
    sequence (:declination) { |n| 20.0 + "0.#{n}".to_f }
  end
end
