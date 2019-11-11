class AddBookedToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :booked, :boolean, default: true
  end
end
