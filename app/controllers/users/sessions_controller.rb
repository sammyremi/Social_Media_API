# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_signed_out_user, only: [:destroy]


  def destroy

    if user_signed_in?
      verify_user_token_and_logout
    else
      render json: { message: "no active session"}, status: :unauthorized
    end
  end


  private

  def respond_with(resource, options = {})
    render json: { status: { message: "signed in successfully", data: resource}}, status: :ok
    
  end

  def verify_user_token_and_logout
    if request.headers['Authorization'].present?
      begin
        jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
        current_user = User.find(jwt_payload['sub'])
        sign_out(current_user)
        render json: { message: "user sign_out successfully"}, status: :ok
      rescue => e
        render json: {message: e}, status: :unauthorized
      end
    else
      render json: {message: "missing token"}, status: :unauthorized
    end
  end

end
