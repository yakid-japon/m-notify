require "slack-notify"
require 'dotenv'
require 'clockwork'
require 'active_support/time'
include Clockwork


Dotenv.load('./.env')

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end
end

every(3.minutes, 'job') do
  client = SlackNotify::Client.new(
    webhook_url: ENV["WEBHOOK_URL"],
    channel: "#test",
    username: "mybot",
    icon_url: "http://mydomain.com/myimage.png",
    icon_emoji: ":shipit:",
    link_names: 1
    )
  client.notify("Hello There!!!!!!!")
end
