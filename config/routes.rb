Rails.application.routes.draw do
  root 'cheatsheets#index'
  get    '/signup', to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#detroy'

  resources :users

  resources :cheatsheets do
    resources :cheats
  end

  namespace :api do
    namespace :v1 do
      resource :cheatsheet_api
    end
  end
end
