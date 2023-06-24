# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  user_name: Rails.application.credentials.sendgrid.user_name,
  password: Rails.application.credentials.sendgrid.password,
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
