Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "timeline#index"
   
  get "/timeline" => "timeline#index", as: :timeline

  
  get "/users" => "users#index", as: :users
  
  get "/users/:id" => "users#show", as: :user
  
  get "/follow/:id" => "users#follow", as: :follow_user
  
  get "/unfollow/:id" => "users#unfollow", as: :unfollow_user
  
  resources :messages
 # root "timeline#index"
end
