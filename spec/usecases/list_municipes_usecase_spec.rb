# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ListMunicipesUsecase do
  let(:municipe_repository) { instance_double(MunicipeRepository) }
  subject(:list_municipes_usecase) { described_class.new(municipe_repository) }

  describe '#execute' do
    context 'when search input is present' do
      let(:search_input) { { search: 'John Doe' } }
      let(:filtered_municipes) { build_stubbed_list(:municipe, 2) }

      it 'filters municipes based on search input' do
        allow(municipe_repository).to receive(:filter_by).with(search_input[:search]).and_return(filtered_municipes)
        expect(list_municipes_usecase.execute(search_input)).to eq(filtered_municipes)
      end
    end

    context 'when search input is not present' do
      let(:empty_search_input) { { search: nil } }
      let(:all_municipes) { build_stubbed_list(:municipe, 3) }

      it 'returns all municipes' do
        allow(municipe_repository).to receive(:all).and_return(all_municipes)
        expect(list_municipes_usecase.execute(empty_search_input)).to eq(all_municipes)
      end
    end
  end
end
