# frozen_string_literal: true

# override devise code and devise code have only if so need to disable rubocop MissingElse
# rubocop:disable Style/MissingElse:
if defined?(ActionMailer)
  class Devise::Mailer < Devise.parent_mailer.constantize
    include Devise::Mailers::Helpers

    def confirmation_instructions(record, token, opts = {})
      @token = token
      attachments.inline['logo.png'] = File.read(Rails.root.join('public/images/logo.png'))
      devise_mail(record, :confirmation_instructions, opts)
    end
  end
end
# rubocop:enable Style/MissingElse:
