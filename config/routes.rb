Rails.application.routes.draw do

  resources :categories
  get 'home/index'

  root 'home#index'
  resources :spents
  resources :expenses
  resources :payments
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
