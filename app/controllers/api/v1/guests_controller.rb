class Api::V1::GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :update, :destroy]

  # POST /api/v1/users/1/events/1/guests
  def create
    guest = Guest.new(guest_params)
    if guest.save
      render json: guest, except: [:created_at, :updated_at] status: :created
    else
      render json: { errors: { type: 'newGuest', content: guest.errors.full_messages } }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1/events/1/guests/1
  def update
    if @guest.update(guest_params)
      render json: { notice: `#{@guest.name} has been updated` }, status: :partial_content
    else
      render json: { errors: { type: 'guestUpdate', content: @guest.errors.full_messages } }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1/events/1/guests/1
  def destroy
    @guest.destroy
    render json: { notice: `#{@guest.name} has been deleted` }, status: :partial_content
  end

  private

    def set_guest
      @guest = Guest.find(params[:id])
    end

    def guest_params
      params.require(:guest).permit(:firstName, :middleName, :lastName, :neighbors, :guestsYes, :guestsNo, :descriptionsYes, :descriptionsNo, :traits, :seated, :issues)
    end
end
