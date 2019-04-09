Rails.application.routes.draw do
  resources :activity_keywords
  resources :keywords
  resources :trips
  resources :activities
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
