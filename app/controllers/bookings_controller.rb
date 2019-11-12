class BookingsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    booking = Booking.new()
    booking.event = @event
    booking.user = current_user
    booking.save
    redirect_to event_path(@event)
  end

end
