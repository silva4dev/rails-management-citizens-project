# frozen_string_literal: true

require "twilio-ruby"

class TwilioService
  def initialize
    @client = Twilio::REST::Client.new(
      ENV.fetch("TWILIO_ACCOUNT_SID", nil),
      ENV.fetch("TWILIO_AUTH_TOKEN", nil)
    )
  end

  def send_sms(number, message)
    @client.messages.create(
      from: ENV.fetch("TWILIO_PHONE_NUMBER", nil),
      to: number,
      body: message
    )
  rescue Twilio::REST::RestError => e
    Rails.logger.error e.message
  end
end
