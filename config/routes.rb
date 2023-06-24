# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users,
                     controllers: {
                      registrations: 'users/registrations'
                     }
  namespace :api do
    namespace :v1 do
      get 'movies/download_csv', to: 'movies#download_csv'
      resources :movies do
        resources :user_reviews, only: [:create]
      end
    end
  end
end
