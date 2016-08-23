require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

get '/sms-quickstart' do
  sender = params[:From]
  friends = {

      friend_number = ENV['FRIEND_NUMBER'] => friend_name = ENV['FRIEND_NAME']
  }
  name = friends[sender] || "Mobile Monkey"
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Hey, #{name}! Have you seen the creepy cat!"
  end
  twiml.text
end
