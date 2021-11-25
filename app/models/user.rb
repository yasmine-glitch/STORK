class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :activities, through: :bookings
  has_many :travels, dependent: :destroy
  has_one_attached :photo

  validates :photo, presence: true
  validates :first_name, :last_name, presence: true
end
