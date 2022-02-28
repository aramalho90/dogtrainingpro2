Rails.application.routes.draw do
  resources :groupclasses
  resources :pttrains
  resources :grouptrains
  resources :ptmaps
  resources :groupmaps
  resources :owners
  resources :dogs
    root 'home#index'
    get 'home/index'
    get 'groupclass', to: 'groupclasses#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
