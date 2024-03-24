# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  subject(:address) { build(:address) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:cep) }
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:district) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:uf) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:municipe) }
  end

  describe 'validations formats' do
    context 'with correct formats' do
      it { is_expected.to allow_value(address.cep).for(:cep) }
    end

    context 'with incorrect formats' do
      it { is_expected.not_to allow_value('incorrect_cep').for(:cep) }
    end
  end
end
