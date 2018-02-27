Rails.application.routes.draw do

 
resources :movies do
  resources :comments
end

resources :users
resources :sessions, only: [:new, :create] 
delete "/logout" => "sessions#destroy", as: :logout

root 'welcome#index'
end
