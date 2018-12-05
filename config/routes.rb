Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cheatsheets do
    resources :cheats
  end

  resource :scrapper_api

  root 'cheatsheets#index'
end
