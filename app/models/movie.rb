class Movie < ApplicationRecord
  has_many :events

  validates :name, presence: true
  validates :genre, inclusion: { in: ["Comedy", "Horror", "Romance", "Science Fiction", "Action", "Documentary", "Adventure", "Animation", "Drama", "Musical", "Thriller"] }
end
