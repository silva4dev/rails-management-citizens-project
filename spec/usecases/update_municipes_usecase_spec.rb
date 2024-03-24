# frozen_string_literal: true

require "rails_helper"

RSpec.describe UpdateMunicipeUsecase do
  subject(:usecase) { described_class.new(municipe_repository) }

  let(:municipe_repository) { instance_double(MunicipeRepository) }
  let(:municipe_id) { 1 }
  let(:updated_municipe_params) { attributes_for(:municipe) }
  let(:invalid_municipe_params) { attributes_for(:municipe, full_name: nil) }

  describe "#execute" do
    context "with valid params" do
      it "updates the municipe" do
        expect(municipe_repository).to receive(:update).with(municipe_id, updated_municipe_params)
        usecase.execute(id: municipe_id, municipe_params: updated_municipe_params)
      end
    end

    context "with invalid params" do
      it "does not update the municipe" do
        expect(municipe_repository).to receive(:update).with(municipe_id, invalid_municipe_params)
        usecase.execute(id: municipe_id, municipe_params: invalid_municipe_params)
      end
    end
  end
end
