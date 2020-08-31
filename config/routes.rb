Rails.application.routes.draw do
  root 'users#home'
  resources :users
  resources :attractions

  get 'signin' => "sessions#new"
  post 'signedin' => "sessions#create"
  get 'logout' => "users#destroy"
  post 'ride' => "attractions#ride"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
