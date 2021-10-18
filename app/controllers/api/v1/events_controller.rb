# frozen_string_literal: true

module Api
  module V1
    class EventsController < ApplicationController
      before_action :set_event, only: %i[update destroy]

      # POST /api/v1/users/1/events
      def create
        user = User.find(params[:user_id])
        event = user.events.build(event_params)
        if event.save
          event_json = EventSerializer.new(event).to_serialized_json_with_guests
          render json: event_json, status: :created
        else
          content = event.errors.full_messages
          render_errors('newEvent', content)
        end
      end

      # PATCH/PUT /api/v1/events/1
      def update
        if @event.update(event_params)
          render json: { notice: "#{@event.name} has been updated" }
        else
          content = @event.errors.full_messages
          render_errors('eventUpdate', content)
        end
      end

      # DELETE /api/v1/events/1
      def destroy
        @event.destroy
        render json: {
          notice: "#{@event.name} has been deleted"
        }, status: :partial_content
      end

      private

      def set_event
        @event = Event.find(params[:id])
      end

      def event_params
        params.require(:event).permit(:id, :name, :table, :chairs, :guests, :guestQty, :descriptions, :newlyAffectedGuests, :user_id)
      end
    end
  end
end
