Rails.application.routes.draw do
  get '/cat_cafes', to: 'cat_cafes#index'

  get '/dog_parks', to: 'dog_parks#index'
  get '/dog_parks/:id', to: 'dog_parks#show'
end
