Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'sessions' => 'sessions#create'
      resources :users, only: [] do
        resources :posts, only: [:index] do
          resources :comments, only: %i[index create]
        end
      end
    end
  end
  devise_for :users
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[new create]
    end
  end
end
