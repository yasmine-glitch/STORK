class Booking < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  attribute :status, default: "Pending"
  validates :user, uniqueness: { scope: :activity, message: "You are already in !"}
end
