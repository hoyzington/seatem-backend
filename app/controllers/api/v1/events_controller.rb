class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: [:update, :destroy]

  # POST /api/v1/events
  def create
    event = Event.new(event_params)
    if event.save
      render json: event, status: :created
    else
      render json: { errors: { type: 'newEvent', content: event.errors.full_messages } }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/events/1
  def update
    if @event.update(event_params)
      render json: { notice: `#{@event.name} has been updated` }, status: :partial_content
    else
      render json: { errors: { type: 'eventUpdate', content: @event.errors.full_messages } }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/events/1
  def destroy
    @event.destroy
    render json: { notice: `#{@event.name} has been deleted` }, status: :reset_content
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:id, :name, :table, :chairs, :guests, :guestQty, :descriptions, :newlyAffectedGuests, :user_id)
    end
end
