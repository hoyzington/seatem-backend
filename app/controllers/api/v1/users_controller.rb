class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  # GET /api/v1/users/1
  def show
    # byebug
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      user_json = UserSerializer.new(user).serialized_json
      render json: user_json, status: :accepted
    else
      render json: { error: "Incorrect email and/or password" }
    end
  end

  def get_current_user
    if logged_in?
      user_json = UserSerializer.new(current_user).serialized_json
      render json: user_json, status: :accepted
    else
      render json: { error: "No one logged in" }
    end
  end

  # POST /api/v1/users
  def create
    user = User.new(user_params)
    if user.save
      user_json = UserSerializer.new(user).serialized_json
      render json: user_json, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if user.update(user_params)
      user_json = UserSerializer.new(@user).serialized_json
      render json: user_json, status: :updated
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
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
      params.require(:user).permit(:username, :email, :password)
    end
end
