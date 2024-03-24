# frozen_string_literal: true

class CreateMunicipeUsecase
  def initialize(municipe_repository)
    @municipe_repository = municipe_repository
  end

  def execute(input)
    @municipe_repository.create(input[:municipe_params])
  end
end
