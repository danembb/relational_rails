Rails.application.routes.draw do
  get '/cat_cafes', to: 'cat_cafes#index'

  get '/dog_parks', to: 'dog_parks#index'
  get '/dog_parks/new', to: 'dog_parks#new'
  post '/dog_parks', to: 'dog_parks#create'
  get '/dog_parks/:id', to: 'dog_parks#show'
  get '/dog_parks/:id/edit', to: 'dog_parks#edit'
  patch 'dog_parks/:id', to: 'dog_parks#update'

  get '/dog_parks/:dog_park_id/dogs', to: 'dog_park_dogs#index'
  get '/dog_parks/:dog_park_id/dogs/new', to: 'dog_park_dogs#new'
  post '/dog_parks/:dog_park_id/dogs/', to: 'dog_park_dogs#create'

  get '/dogs', to: 'dogs#index'
  get '/dogs/:id', to: 'dogs#show'
end
