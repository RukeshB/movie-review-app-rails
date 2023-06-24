# frozen_string_literal: true

class DeviseMailerPreview < ActionMailer::Preview
  # http://localhost:3000/rails/mailers/devise_mailer/confirmation_instructions
  def confirmation_instructions
    Devise::Mailer.confirmation_instructions(User.first, 'faketoken')
  end
end
