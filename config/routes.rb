Rails.application.routes.draw do
  get '/cat_cafes', to: 'cat_cafe#index'
  
  get '/dog-parks', to: 'dog_parks#index'
  get 'dog-parks/:id', to:'dog_parks#show'
end
