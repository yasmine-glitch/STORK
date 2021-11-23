class Activity < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings
  has_many :users, through: :bookings
  has_one_attached :photo

  validates :name, :place, :start_date, :end_date, :capacity_max, presence: true
end
