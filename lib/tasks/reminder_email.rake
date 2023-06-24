# frozen_string_literal: true

namespace :reminder_email do
  desc 'send confirmation reminder mail to user who has not confirmed his account'
  task send_reminder_email: :environment do
    user_list = User.all
    user_list.each do |user|
      user.send_confirmation_instructions unless user.confirmed?
    end
  end
end
