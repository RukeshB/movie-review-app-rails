# frozen_string_literal: true

class Api::V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    params[:user][:role] = Constant::AUDIENCE
    super
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name role])
  end
end
