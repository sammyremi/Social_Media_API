# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]


  private

  def respond_with(resource, options = {})
    render json: { status: { message: "signed in successfully", data: resource}}, status: :ok
    puts current_user.inspect
  end

  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
    current_user = User.find(jwt_payload['sub'])

    puts current_user.inspect
  end

end
