require 'slack-ruby-client'
require 'blanket'
require 'dotenv'
require 'pry'
require './insult'
Dotenv.load

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

client = Slack::RealTime::Client.new

client.on :message do |data|
  text_arr = data.text.split(' ')
  if data.text =~ /insult/
    puts data
    i = Insult.new
    client.web_client.chat_postMessage(channel: '#general', text: "Hey #{text_arr[1]}! #{i.insult}")
  else
    puts data
  end
end
client.start!
