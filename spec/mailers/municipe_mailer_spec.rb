# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MunicipeMailer, type: :mailer do
  include ActionView::Helpers::TranslationHelper

  describe '#created' do
    let(:municipe) { create(:municipe) }
    let(:mail) { described_class.created(municipe) }

    it 'return renders when municipe is created' do
      expect(mail.subject).to eq(t('mailers.municipe_mailer.created'))
      expect(mail.to).to eq([municipe.email])
      expect(mail.from).to eq(['app@example.com'])
      expect(mail.body.encoded).to include(municipe.full_name)
      expect(mail.body.encoded).to include(t('mailers.municipe_mailer.created'))
      expect(mail.body.encoded).to include("/municipes/#{municipe.id}/edit")
    end
  end

  describe '#updated' do
    let(:municipe) { create(:municipe) }
    let(:mail) { described_class.updated(municipe) }

    it 'return renders when municipe is updated' do
      expect(mail.subject).to eq(t('mailers.municipe_mailer.updated'))
      expect(mail.to).to eq([municipe.email])
      expect(mail.from).to eq(['app@example.com'])
      expect(mail.body.encoded).to include(municipe.full_name)
      expect(mail.body.encoded).to include(t('mailers.municipe_mailer.updated'))
      expect(mail.body.encoded).to include("/municipes/#{municipe.id}/edit")
    end
  end
end
