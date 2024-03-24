# frozen_string_literal: true

class UpdateMunicipeUsecase
  def initialize(municipe_repository)
    @municipe_repository = municipe_repository
  end

  def execute(input)
    @municipe_repository.update(input[:id], input[:municipe_params])
  end
end
