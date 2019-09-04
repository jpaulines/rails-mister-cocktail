Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  # get 'doses/new'
  # get 'doses/create'
  # get 'doses/destroy'
  # get 'cocktails/index'
  # get 'cocktails/show'
  # get 'cocktails/new'
  # get 'cocktails/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [ :index, :show, :new, :create ] do
    resources :doses, only: [ :create ]
    resources :reviews, only: [ :create ]
  end
  resources :doses, only: [ :destroy ]
  resources :reviews, only: [ :destroy ]
end
