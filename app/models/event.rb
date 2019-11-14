class Event < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, presence: true
  validates :address, presence: true
  validates :booking_time, presence: true
  validates :price, presence: true
  validates :description, presence: true

  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
