Rails.application.routes.draw do

  root to: 'movies#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  namespace :admin do
    resources :movies
    resources :users , only: [:index, :show]
  end

  resources :movies, only: [:index, :show]

end
