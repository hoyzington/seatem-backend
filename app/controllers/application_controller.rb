# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ::ActionController::Cookies

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def render_errors(error_type, error_content)
    render json: {
      errors: {
        type: error_type,
        content: error_content
      }
    }, status: :unprocessable_entity
  end
end
