# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  private 

  # render json response for created user 
  def respond_with(resource, options = {})
    if resource.persisted?
      render json: {status: {message: "user created succesfully", code: 201, user: resource}}
    else
      render json: { "message": resource.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
