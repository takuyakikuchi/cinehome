class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update] # we add them later :edit, :update
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = Event.all
  end

  def show
    @marker = [{
      lat: @event.latitude,
      lng: @event.longitude
    }]
  end

  def new
    @event = Event.new()
  end

  def create
    @event = Event.new(event_params)
    @event.movie = Movie.find(event_params[:movie_id])
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:name, :address, :booking_time, :price, :description, :movie_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
