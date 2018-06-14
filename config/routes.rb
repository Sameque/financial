Rails.application.routes.draw do

  resources :provisions

  root 'home#index'

  get 'report/spent'
  get 'report/spentCategory'
  get 'report/expense'
  get 'report/provision'

  resources :categories
  get 'spents/clone/:id', to: 'spents#clone', as: 'spents_clone'
  resources :spents
  # get '/spents/clone/:id', to: 'spents#clone'
  # post 'spents/clone/', to: 'spents#clone', as: 'spents_clone'
  resources :expenses
  resources :payments
  resources :people

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
