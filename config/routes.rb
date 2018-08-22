Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "timeline#index"
   
  get "/timeline" => "timeline#index", as: :timeline
  
  get "/users" => "users#index", as: :users
  
  get "/users/:id" => "users#show", as: :user
  
 # root "timeline#index"
end
