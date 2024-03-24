# frozen_string_literal: true

class MunicipeRepository
  def create(municipe_params)
    municipe = Municipe.new(municipe_params)
    municipe.save
    municipe
  end

  def update(id, municipe_params)
    municipe = Municipe.find(id)
    municipe.update(municipe_params)
    municipe
  end

  def all
    Municipe.all
  end

  def filter_by(municipe_params)
    Municipe.search(municipe_params)
  end
end
