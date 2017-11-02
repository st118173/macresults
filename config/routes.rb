Rails.application.routes.draw do
  devise_for :users
  resources :results
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'results/create'
  get 'results/new'
  post 'results/new'
  get 'results/result'
  get 'results/destroy'
  get 'results/id'
  root 'results#index'
end
