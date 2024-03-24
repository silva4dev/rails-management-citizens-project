# frozen_string_literal: true

class MunicipesController < ApplicationController
  def index
    input = { search: params[:search] }
    @municipes = ListMunicipesUsecase.new(municipe_repository).execute(input)
  end

  def new
    @municipe = Municipe.new
    @municipe.build_address
  end

  def edit
    @municipe = Municipe.find(params[:id])
    @municipe.build_address unless @municipe.address
  end

  def create
    input = { municipe_params: municipe_params }
    @municipe = CreateMunicipeUsecase.new(municipe_repository).execute(input)
    respond_to do |format|
      if @municipe.valid?
        format.html do
          redirect_to municipes_url, flash: { success: 'Seu cadastro foi efetuado com sucesso.' }
        end
      else
        flash.now[:error] = 'Erro ao criar o munícipe. Verifique os campos e tente novamente.'
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    input = { id: params[:id], municipe_params: municipe_params }
    @municipe = UpdateMunicipeUsecase.new(municipe_repository).execute(input)
    respond_to do |format|
      if @municipe.valid?
        format.html do
          redirect_to municipes_url, flash: { success: 'Registro atualizado com sucesso.' }
        end
      else
        flash.now[:error] = 'Erro ao atualizar o munícipe. Verifique os campos e tente novamente.'
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def municipe_repository
    @municipe_repository ||= MunicipeRepository.new
  end

  def municipe_params
    params.require(:municipe).permit(:full_name, :cpf, :cns, :email, :date_of_birth, :phone, :photo, :status,
                                     address_attributes: %i[street cep complement district city uf ibge_code])
  end
end
