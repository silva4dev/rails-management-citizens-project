# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateMunicipeUsecase do
  subject(:usecase) { described_class.new(municipe_repository) }

  let(:municipe_repository) { instance_double(MunicipeRepository) }

  describe '#execute' do
    context 'with valid params' do
      let(:valid_municipe_params) { attributes_for(:municipe) }

      it 'creates a new municipe' do
        expect(municipe_repository).to receive(:create).with(valid_municipe_params)
        usecase.execute(municipe_params: valid_municipe_params)
      end
    end

    context 'with invalid params' do
      let(:invalid_municipe_params) { attributes_for(:municipe, full_name: nil) }

      it 'does not create a new municipe' do
        expect(municipe_repository).to receive(:create).with(invalid_municipe_params)
        usecase.execute(municipe_params: invalid_municipe_params)
      end
    end
  end
end
