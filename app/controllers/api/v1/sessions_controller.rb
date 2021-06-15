class Api::V1::SessionsController < ApplicationController

  # POST /api/v1/login
  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      user_json = UserSerializer.new(user).to_serialized_json_with_events
      render json: user_json, status: :created
    else
      render json: { errors: { type: 'login', content: "Incorrect email/password" } }, status: :unprocessable_entity
    end
  end

  # POST /api/v1/get_current_user
  def get_current_user
    if logged_in?
      user_json = UserSerializer.new(current_user).to_serialized_json_with_events
      render json: user_json, status: :partial_content
    else
      render json: { error: "No one logged in" }
    end
  end

  # POST /api/v1/logout
  def destroy
    session.clear
    render json: { notice: 'Successfully logged out' }, status: :partial_content
  end
end
