class BookingsController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    booking_user = current_user #current user from pundit
    booking = Booking.new()
    booking.event = event
    booking.user = booking_user
    Booking.save
  end

end
