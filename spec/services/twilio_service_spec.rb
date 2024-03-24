# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TwilioService do
  describe '#send_sms' do
    let(:number) { 'any_number' }
    let(:message) { 'any_message' }

    it 'sends a message to the specified number with the provided content' do
      client = instance_double(Twilio::REST::Client)
      messages = instance_double(Twilio::REST::Api::V2010::AccountContext::MessageList)
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      allow(client).to receive(:messages).and_return(messages)
      expect(messages).to receive(:create).with(from: ENV.fetch('TWILIO_PHONE_NUMBER', nil), to: number, body: message)
      described_class.new.send_sms(number, message)
    end
  end
end
