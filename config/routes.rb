Rails.application.routes.draw do

  get '/' => 'users#index'

  resources :users do
    resources :coverage_reports do
      resources :hits
    end
  end
end
