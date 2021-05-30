class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # POST /api/v1/events
  def create
    event = Event.new(event_params)

    if event.save
      render json: event, status: :created, location: event
    else
      render json: event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/events/1
  def update
    if event.update(event_params)
      render json: event, status: :updated
    else
      render json: event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/events/1
  def destroy
    event.destroy
    render json: {userId: user.id}, status: :destroyed
  end

  private

    def set_event
      event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:data, :user_id)
    end
end
