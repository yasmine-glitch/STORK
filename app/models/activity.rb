class Activity < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings
  has_many :users, through: :bookings
  has_one_attached :photo

  validates :name, :place, :start_date, :end_date, :capacity_max, presence: true
  geocoded_by :place

  include PgSearch::Model
  pg_search_scope :search_by_place,
                  against: :place,
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
