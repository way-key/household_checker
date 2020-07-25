# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
require File.expand_path(File.dirname(__FILE__) + "/environment")
rails_env = Rails.env.to_sym
set :output, "log/cron.log"
set :environment, rails_env
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
every 1.days, at: '9:00 am' do

  runner "NotificationMailer.send_when_check.deliver"
end
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
