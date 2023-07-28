Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end

  get '/post/new', to: 'post#new', as: 'new_form_post'
  post '/post', to: 'post#create', as: 'form_posts'
  get '/comment/new', to: 'comment#new', as: 'new_form_comment'
  post '/comment', to: 'comment#create', as: 'form_comments'
  get '/posts/:id/increment_likes', to: 'posts#increment_likes', as: 'increment_likes'
end
