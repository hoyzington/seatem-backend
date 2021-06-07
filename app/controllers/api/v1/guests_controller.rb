class Api::V1::GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :update, :destroy]

  # GET /api/v1/guests
  def index
    @guests = Guest.all
    render json: @guests
  end

  # GET /api/v1/guests/1
  def show
    render json: @guest
  end

  # POST /api/v1/guests
  def create
    @guest = Guest.new(guest_params)

    if @guest.save
      render json: @guest, status: :created, location: @guest
    else
      render json: @guest.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/guests/1
  def update
    if @guest.update(guest_params)
      render json: @guest
    else
      render json: @guest.errors, status: :unprocessable_entity
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
