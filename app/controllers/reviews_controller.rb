class ReviewsController < ApplicationController
  before_action :set_event, only: [:edit, :update]
  before_action :set_review, only: [:edit, :show, :update]

  def new
    @review = Review.new()
  end

  def show
  end

  def create
    @review = Review.new(review_params)
    @event = Event.find(params[:event_id])
    @review.event = @event
    @review.user = current_user
    if  @review.save
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end

  def edits
  end

  def update
    # @review = @event.reviews.where(user: current_user).where(review_id: params[:review_id])
    @review.update(review_params)
    @event = Event.find(params[:event_id])
    @review.event = @event
    @review.save
    redirect_to event_path(@event)
  end

  def destroy
    review = Review.find(params[:event_id])
    review.destroy
    redirect_to event_path(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
