# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :municipe
  validates :cep, :street, :district, :city, :uf, presence: true
  validates :cep, format: { with: /\A\d{5}-\d{3}\z/ }
end
