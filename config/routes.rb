Rails.application.routes.draw do
  devise_for :users

  resources :spendings
  resources :shares

  root to: 'users#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
