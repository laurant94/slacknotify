require 'slack-notify'
require "clockwork"
require 'active_support/time'



def notify
  webhook_url = "https://hooks.slack.com/services/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"

  client = SlackNotify::Client.new(channel: "#diveintocode",
                                  webhook_url: webhook_url,
                                  username: "Mathieu",
                                  icon_emoji: ":shipit:")
  msg = "Salut"
  client.notify(msg)
end

module Clockwork
  handler do |job|
    puts "sending new comment to slack #diveintocode"
    notify
  end
  every(3.minutes, "notify" )
end
