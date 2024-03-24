# frozen_string_literal: true

require 'cns_brazil/generator'

FactoryBot.define do
  factory :municipe do
    full_name { Faker::Name.name }
    cpf { Faker::CPF.formatted }
    cns { CnsBrazil::Generator.new.call }
    email { Faker::Internet.unique.email }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    phone { '+55 (19) 99346-7834' }
    photo do
      Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/avatar.png'))
    end
  end
end
