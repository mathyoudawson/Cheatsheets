Rails.application.routes.draw do
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :cheatsheets do
    resources :cheats
  end

  namespace :api do
    namespace :v1 do
      resource :cheatsheet_api
    end
  end

  root 'cheatsheets#index'
end
