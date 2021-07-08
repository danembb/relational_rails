Rails.application.routes.draw do
  get '/dog-parks', to: 'dog_parks#index'
end
