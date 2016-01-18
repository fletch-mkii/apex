require 'faker'
FactoryGirl.find_definitions
include ApplicationHelper

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "testuser#{n}" }
    sequence(:email) { |n| "testemail#{n}@example.com" }
    sequence (:password) { |n| "password#{n}" }
  end
end
