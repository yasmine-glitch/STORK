class Activity < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :users, through: :bookings

  validates :name, :place, :start_date, :end_date, :capacity_max, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_place_and_start_date,
    against: [:place, :start_date],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
