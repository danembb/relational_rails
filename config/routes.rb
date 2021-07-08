Rails.application.routes.draw do
  get '/dog-parks', to: 'dog_parks#index'
  get 'dog-parks/:id', to:'dog_parks#show'
end
