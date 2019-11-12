class EventsController < ApplicationController
  def new
    @event = Event.new()
  end

  def create
    @event = Event.new(event_params)
    @event.movie = Movie.find(event_params[:movie_id])
    if @event.save
      redirect_to events_path(@event)
    else
      render :new
    end
  end

  private
  
  def event_params
    params.require(:event).permit(:name, :address, :booking_time, :price, :description, :movie_id)
  end
end
