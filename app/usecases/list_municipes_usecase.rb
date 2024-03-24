# frozen_string_literal: true

class ListMunicipesUsecase
  def initialize(municipe_repository)
    @municipe_repository = municipe_repository
  end

  def execute(input)
    if input[:search].present?
      @municipe_repository.filter_by(input[:search])
    else
      @municipe_repository.all
    end
  end
end
