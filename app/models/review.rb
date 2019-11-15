class Review < ApplicationRecord
  belongs_to :event
  belongs_to :user
  # no validation
  validates :rating, inclusion: { in: 0..5, message: "Invalid input" }
end
