class Booking < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  attribute :status, default: "pending"
end
