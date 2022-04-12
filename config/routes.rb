# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/orders', to: 'orders#index'
  get '/orders/active', to: 'orders#active'
  get '/orders/refresh', to: 'orders#refresh'
end
