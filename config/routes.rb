Rails.application.routes.draw do
  resources :posts
  root 'users#index'
  get '/search' => 'telnos#search', :as => 'search_telno'
  resources :telnos
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
