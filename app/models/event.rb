class Event < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :name, presence: true
  validates :address, presence: true
  validates :booking_time, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
