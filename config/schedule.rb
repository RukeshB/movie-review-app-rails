# frozen_string_literal: true

set :output, 'log/cron.log'
env :PATH, ENV['PATH']

every 1.day, at: '10:00 am' do
  rake 'reminder_email:send_reminder_email'
end
