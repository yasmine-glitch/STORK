class Activity < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :users, through: :bookings

  validates :name, :place, :start_date, :end_date, :capacity_max, presence: true
end
