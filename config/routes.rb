Rails.application.routes.draw do
  get 'cheatsheets/index'
  get 'cheatsheets/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cheatsheets

  resources :cheatsheets do
    resources :cheats
  end

  root 'cheatsheets#index'
end
