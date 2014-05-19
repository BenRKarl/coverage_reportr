Rails.application.routes.draw do

  get '/' => 'users#index'

  get 'users/new' => 'users#new'
  post 'users' => 'users#create'

  get 'sessions/new' => 'sessions#new'
  post 'sessions' => 'sessions#create'

  get 'sessions/log_out' => 'sessions#destroy'

  get 'profiles' => 'profiles#index'

  resources :users
  resources :coverage_reports
  resources :hits

end
