# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.0'

gem 'bootsnap', require: false
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'rack', '~> 2.0'
gem 'rails'
gem 'redis', '~> 4.0'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'validates_cpf'
gem 'date_validator'
gem 'cns_brazil'
gem 'faraday'
gem 'twilio-ruby'
gem 'elasticsearch', '~> 7.17.7'
gem 'searchkick'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'better_errors'
  gem 'dotenv-rails'
  gem 'erb-formatter'
  gem 'erb_lint'
  gem 'rubocop'
  gem 'cpf_faker'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'guard-livereload'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end
