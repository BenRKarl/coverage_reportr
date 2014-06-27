Rails.application.routes.draw do

  root 'users#index'

  get 'sessions/new' => 'sessions#new'
  post 'sessions' => 'sessions#create'

  get 'sessions/log_out' => 'sessions#destroy'

  get 'profiles' => 'profiles#index'

  get 'coverage_reports/find' => 'coverage_reports#find'
  post 'coverage_reports/share' => 'coverage_reports#share'

  resources :users
  resources :coverage_reports
  resources :hits

end
