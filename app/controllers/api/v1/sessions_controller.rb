# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      # POST /api/v1/login
      def create
        user = User.find_by(email: params[:user][:email])
        if user&.authenticate(params[:user][:password])
          session[:user_id] = user.id
          user_json = UserSerializer.new(user).to_serialized_json_with_events
          render json: user_json, status: :created
        else
          content = 'Incorrect email/password'
          render_errors('login', content)
        end
      end

      # POST /api/v1/access_current_user
      def access_current_user
        if logged_in?
          user_json = UserSerializer.new(current_user).to_serialized_json_with_events
          render json: user_json, status: :partial_content
        else
          render json: { error: 'No one logged in' }
        end
      end

      # POST /api/v1/logout
      def destroy
        session.clear
        render json: { notice: 'Successfully logged out' }, status: :partial_content
      end
    end
  end
end
