class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update] # we add them later :edit, :update
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params.has_key?(:range_search)
      @events = Event.near(params[:range_search][:location], params[:range_search][:range])
    elsif params[:query].present?
      @events = Event.joins(:movie).where(movie: {genre: params[:search][:query]})
    else 
      @events = Event.all
    end

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
    params.require(:event).permit(:name, :address, :booking_time, :price, :description, :movie_id, :capacity)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
