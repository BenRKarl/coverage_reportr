Rails.application.routes.draw do

  get '/' => 'users#index'

  resources :users
  resources :coverage_reports
  resources :hits

end
