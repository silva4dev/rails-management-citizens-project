# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect("/municipes")
  resources :municipes, except: %i[destroy show]
end
