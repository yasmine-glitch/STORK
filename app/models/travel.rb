class Travel < ApplicationRecord
  belongs_to :user
  has_many :activities, through: :user

  validates :country, :start_date, presence: true
end
