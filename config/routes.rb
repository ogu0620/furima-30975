Rails.application.routes.draw do
  devise_for :users
  
  resources :items, expect: [:index]

root to: "items#index"
end
