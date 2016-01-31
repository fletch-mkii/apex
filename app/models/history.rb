class History < ActiveRecord::Base
  belongs_to :star
  belongs_to :user

  validates :user_id, presence: true
  validates :star_id, presence: true
end
