# frozen_string_literal: true

class ApplicationController < ActionController::API
  respond_to :json
  include ActionController::MimeResponds
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :unauthorized

  def unauthorized
    render(json: { message: I18n.t('user.unauthorized') }, status: :unauthorized)
  end
end
