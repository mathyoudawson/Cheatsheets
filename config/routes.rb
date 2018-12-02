Rails.application.routes.draw do
  get 'cheatsheets/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'cheatsheets#index'
end
