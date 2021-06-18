class Api::V1::GuestsController < ApplicationController
  before_action :set_guest, only: [:update, :destroy]

  # POST /api/v1/events/1/guests
  def create
    event = Event.find(params[:event_id])
    guest = event.guests.build(guest_params)
    if guest.save
      guest_json = GuestSerializer.new(guest).to_serialized_json
      render json: guest_json, status: :partial_content
    else
      render json: { errors: { type: 'newGuest', content: guest.errors.full_messages } }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/guests/1
  def update
    if @guest.update(guest_params)
      # guest_json = GuestSerializer.new(@guest).to_serialized_json
      # render json: guest_json, status: :partial_content
      render json: { notice: "#{@guest.firstName} has been updated" }, status: :partial_content
    else
      render json: { errors: { type: 'guestUpdate', content: @guest.errors.full_messages } }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/guests/1
  def destroy
    @guest.destroy
    render json: { notice: "#{@guest.name} has been deleted" }, status: :partial_content
  end

  private

    def set_guest
      @guest = Guest.find(params[:id])
    end

    def guest_params
      params.require(:guest).permit(:firstName, :middleName, :lastName, :neighbors, :guestsYes, :guestsNo, :descriptionsYes, :descriptionsNo, :traits, :seated, :issues)
    end
end
