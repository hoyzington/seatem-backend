class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: [:update, :destroy]

  # POST /api/v1/events
  def create
    event = Event.new(event_params)
    if event.save
      render json: EventSerializer.new(event).to_serialized_json, status: :created
    else
      render json: { errors: event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/events/1
  def update
    if event.update(event_params)
      render json: EventSerializer.new(event).to_serialized_json, status: :created
    else
      render json: { errors: event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/events/1
  def destroy
    event.destroy
    render json: { eventId: event.id }, status: :destroyed
  end

  private

    def set_event
      event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:id, :name, :table, :chairs, :guests, :guestQty, :descriptions, :newlyAffectedGuests, :user_id)
    end
end
