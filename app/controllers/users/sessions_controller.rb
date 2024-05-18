# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_signed_out_user, only: [:destroy]

  def destroy
    if user_signed_in?
      sign_out(current_user)
      render json: { message: "user sign_out successfully"}, status: :ok
    else
      render json: { message: "no active session"}, status: :unauthorized
    end
  end


  private

  def respond_with(resource, options = {})
    render json: { status: { message: "signed in successfully", data: resource}}, status: :ok
    puts user_signed_in?, current_user
  end

end
