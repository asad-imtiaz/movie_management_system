Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :movies, only: [:index, :show]
    end
  end

  namespace :admin do
    resources :movies do
      member do
        post :remove_poster
        post :set_featured
      end
      resources :reviews, only: :destroy do
        member do
          post :unflag
        end
        collection do
          get :flagged
        end
      end
    end
    resources :home, only: :index
    resources :reviews, only: :index
    resources :actors
    resources :users , only: [:index, :show]
  end

  resources :home, only: :index
  resources :actors, only: [:index, :show]
  resources :movies, only: [:index, :show] do
    resources :reviews, only: [:create, :update, :destroy] do
      member do
        post :flag
      end
      collection do
        get :show_form
      end
    end
    resources :ratings, only: [:create, :update]
  end

  resources :users, only: :show do
    member do
      post :update_favorite
    end
  end
end
