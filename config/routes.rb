Rails.application.routes.draw do

  resources :provisions
  root 'home#index'

  get 'report/spent'
  get 'report/spentCategory'
  get 'report/expense'

  resources :categories
  resources :spents
  resources :expenses
  resources :payments
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
