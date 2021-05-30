class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /api/v1/users/1
  def show
    user_json = UserSerializer.new(@user).serialized_json
    render json: user_json, status: :accepted
  end

  # POST /api/v1/users
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created, location: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if user.update(user_params)
      render json: user, status: :updated
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  def destroy
    user.destroy
    render json: {userId: user.id}, status: :destroyed
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password_digest)
    end
end
