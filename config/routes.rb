Rails.application.routes.draw do
  get '/users', to: 'users#index, as: 'users'
end
