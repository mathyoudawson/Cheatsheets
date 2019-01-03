Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"
  get 'password_resets/new'
  get 'password_resets/edit'
  root "pages#show", page: "home"
  get    '/signup', to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :cheatsheets do
    resources :cheats
  end

  namespace :api do
    namespace :v1 do
      resource :cheatsheet_api
    end
  end
end
