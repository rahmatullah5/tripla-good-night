# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[index show]

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index create show update delete] do
        scope module: :users do
          resources :followers, only: %i[index create show update destroy]
          resources :sleeps, only: %i[index create show update destroy]
        end
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
