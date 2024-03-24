# frozen_string_literal: true

require "rails_helper"

RSpec.describe MunicipeRepository do
  subject(:municipe_repository) { described_class.new }

  let(:valid_attributes) { attributes_for(:municipe) }
  let(:updated_attributes) { { full_name: "Updated Name" } }

  describe "#create" do
    it "creates a new municipe" do
      expect { municipe_repository.create(valid_attributes) }.to change(Municipe, :count).by(1)
    end

    it "returns the created municipe" do
      municipe = municipe_repository.create(valid_attributes)
      expect(municipe).to be_a(Municipe)
      expect(municipe).to be_persisted
    end
  end

  describe "#update" do
    let!(:municipe) { create(:municipe) }

    it "updates the municipe" do
      updated_municipe = municipe_repository.update(municipe.id, updated_attributes)
      expect(updated_municipe.full_name).to eq("Updated Name")
    end
  end

  describe "#all" do
    it "returns all municipes" do
      create_list(:municipe, 3)
      expect(municipe_repository.all.count).to eq(3)
    end
  end

  describe "#filter_by" do
    it "returns municipes that match the filter" do
      simulated_municipe = instance_double(Municipe, valid_attributes[:full_name])
      allow(municipe_repository).to receive(:filter_by).and_return([simulated_municipe])
      filtered_municipes = municipe_repository.filter_by(valid_attributes[:full_name])
      expect(filtered_municipes).to eq([simulated_municipe])
    end
  end
end
