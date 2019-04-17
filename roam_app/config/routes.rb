Rails.application.routes.draw do
  resources :activity_keywords
  resources :keywords
  resources :trips
  resources :activities
  resources :users do
    resources :trips, only: [:show, :index]
  end


  root 'users#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
