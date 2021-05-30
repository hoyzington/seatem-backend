class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users/1
  def show
    render json: user, status: :accepted
  end

  # POST /users
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created, location: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if user.update(user_params)
      render json: user, status: :updated
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    user.destroy
    render json: {userId: user.id}, status: :destroyed
  end

  private

    def set_user
      user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password_digest)
    end
end
