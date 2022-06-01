Rails.application.routes.draw do
  devise_for :users
  root to: redirect('homes/main')#ルートURLを指定します。(最初に表示する画面)
  get 'sessions/new'
  get 'homes/main'
  get '/users/:id/edit2', to: 'users#edit2' 
  # get 'login', to: "sessions#new"
  # post 'login', to: "sessions#create"
  # delete 'logout', to: "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :schedules
  resources :hotels
  resources :users

end
