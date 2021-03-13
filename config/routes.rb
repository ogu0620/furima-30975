Rails.application.routes.draw do
  devise_for :users
  
  resources :items, only: [:new, :create,:show,:edit,:update]

root to: "items#index"
end
