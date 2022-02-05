Rails.application.routes.draw do
  resources :pttrains
  resources :grouptrains
  resources :ptmaps
  resources :groupmaps
  resources :owners
  resources :dogs
    root 'home#index'
    get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
