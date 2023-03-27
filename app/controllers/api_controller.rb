# frozen_string_literal: true

class ApiController < ActionController::API
  # protect_from_forgery unless: -> { request.format.json? }

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private

  def render_not_found(error)
    render json: { error: error.message }, status: :not_found
  end
end
