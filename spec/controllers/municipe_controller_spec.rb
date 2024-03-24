# frozen_string_literal: true

require "rails_helper"

RSpec.describe MunicipesController, type: :controller do
  describe "GET #index" do
    it "assigns @municipes" do
      municipes = double("municipes")
      allow(ListMunicipesUsecase).to receive(:new).and_return(double("list_municipes_usecase", execute: municipes))
      get :index
      expect(assigns(:municipes)).to eq(municipes)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #new" do
    it "assigns @municipe" do
      get :new
      expect(assigns(:municipe)).to be_a_new(Municipe)
    end

    it "builds an address for the new municipe" do
      get :new
      expect(assigns(:municipe).address).to be_a_new(Address)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    let(:municipe) { create(:municipe) }

    it "assigns @municipe" do
      get :edit, params: { id: municipe.id }
      expect(assigns(:municipe)).to eq(municipe)
    end

    it "builds an address for the municipe if address does not exist" do
      get :edit, params: { id: municipe.id }
      expect(assigns(:municipe).address).to be_a_new(Address)
    end

    it "renders the edit template" do
      get :edit, params: { id: municipe.id }
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:municipe_params) { attributes_for(:municipe) }

      it "creates a new municipe" do
        expect {
          post :create, params: { municipe: municipe_params }
        }.to change(Municipe, :count).by(1)
      end

      it "redirects to municipes_url" do
        post :create, params: { municipe: municipe_params }
        expect(response).to redirect_to(municipes_url)
      end
    end

    context "with invalid params" do
      let(:invalid_params) { attributes_for(:municipe, full_name: nil) }

      it "does not save the new municipe" do
        expect {
          post :create, params: { municipe: invalid_params }
        }.not_to change(Municipe, :count)
      end

      it "re-renders the new template" do
        post :create, params: { municipe: invalid_params }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    let(:municipe) { create(:municipe) }

    context "with valid params" do
      let(:new_full_name) { "New Name" }

      it "updates the requested municipe" do
        put :update, params: { id: municipe.id, municipe: { full_name: new_full_name } }
        municipe.reload
        expect(municipe.full_name).to eq(new_full_name)
      end

      it "redirects to municipes_url" do
        put :update, params: { id: municipe.id, municipe: { full_name: new_full_name } }
        expect(response).to redirect_to(municipes_url)
      end
    end

    context "with invalid params" do
      let(:invalid_params) { attributes_for(:municipe, full_name: nil) }

      it "does not update the municipe" do
        put :update, params: { id: municipe.id, municipe: invalid_params }
        municipe.reload
        expect(municipe.full_name).not_to be_nil
      end

      it "re-renders the edit template" do
        put :update, params: { id: municipe.id, municipe: invalid_params }
        expect(response).to render_template("edit")
      end
    end
  end
end
