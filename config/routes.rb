Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end

  get '/form_post/new', to: 'form_post#new', as: 'new_form_post'
  post '/form_post', to: 'form_post#create', as: 'form_posts'
  get '/form_comment/new', to: 'form_comment#new', as: 'new_form_comment'
  post '/form_comment', to: 'form_comment#create', as: 'form_comments'
  get '/posts/:id/increment_likes', to: 'posts#increment_likes', as: 'increment_likes'
end
