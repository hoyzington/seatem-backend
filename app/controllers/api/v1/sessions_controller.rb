class Api::V1::SessionsController < ApplicationController

  def create
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

  def destroy
  end
end
