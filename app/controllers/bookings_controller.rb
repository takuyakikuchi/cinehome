class BookingsController < ApplicationController
  before_action :set_event, only: [:update]
  def create
    @event = Event.find(params[:event_id])
    booking = Booking.new()
    booking.event = @event
    booking.user = current_user
    booking.save

    redirect_to event_path(@event)
  end

  def update
    booking = @event.bookings.where(user: current_user).where(booked:true)
    booking.first.booked = false
    booking.first.save

    redirect_to event_path(@event)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
