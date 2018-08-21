Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "timeline#index"
  
  get "/timeline" => "timeline#index"
  get "/users" => "users#index"
  
 # root "timeline#index"
end
