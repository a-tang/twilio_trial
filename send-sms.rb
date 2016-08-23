require 'rubygems'
require 'twilio-ruby'
require 'dotenv'

Dotenv.load

Twilio.configure do |config|
  config.account_sid = ENV['TWILIO_ACCOUNT_SID']
  config.auth_token = ENV['TWILIO_AUTH_TOKEN']
end

client = Twilio::REST::Client.new

 twilio_number = ENV['TWILIO_NUMBER']

friends = {
   friend_number = ENV['FRIEND_NUMBER'] => friend_name = ENV['FRIEND_NAME']
}
friends.each do |key, value|
  client.account.messages.create(
    :from => twilio_number,
    :to => key,
    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
  )
  puts "Sent message to #{value}"
end
