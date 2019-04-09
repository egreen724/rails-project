Rails.application.routes.draw do
  resources :activity_keywords
  resources :keywords
  resources :trips
  resources :activities
  resources :users

  root 'users#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
