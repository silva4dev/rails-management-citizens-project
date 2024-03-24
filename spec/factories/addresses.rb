# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    street { Faker::Address.street_name }
    district { Faker::Address.community }
    city { Faker::Address.city }
    uf { Faker::Address.state }
    cep { '06050-348' }
    complement { Faker::Address.secondary_address }
    ibge_code { Faker::Number.number(digits: 7) }
    association :municipe
  end
end
