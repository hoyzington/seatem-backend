# frozen_string_literal: true

module Api
  module V1
    class GuestsController < ApplicationController
      before_action :set_guest, only: %i[update destroy]

      # POST /api/v1/events/1/guests
      def create
        event = Event.find(params[:event_id])
        guest = event.guests.build(guest_params)
        if guest.save
          guest_json = GuestSerializer.new(guest).to_serialized_json
          render json: guest_json, status: :partial_content
        else
          content = guest.errors.full_messages
          render_errors('newGuest', content)
        end
      end

      # PATCH/PUT /api/v1/guests/1
      def update
        if @guest.update(guest_params)
          render json: { notice: "#{@guest.firstName} has been updated" }, status: :partial_content
        else
          content = @guest.errors.full_messages
          render_errors('guestUpdate', content)
        end
      end

      # DELETE /api/v1/guests/1
      def destroy
        @guest.destroy
      end

      private

      def set_guest
        @guest = Guest.find(params[:id])
      end

      def guest_params
        params.require(:guest).permit(:firstName, :middleName, :lastName, :neighbors, :guestsYes, :guestsNo, :descriptionsYes, :descriptionsNo, :traits, :seated, :issues)
      end
    end
  end
end
