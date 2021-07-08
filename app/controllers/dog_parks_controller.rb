class DogParksController < ApplicationController
  def index
    @dog_parks = DogPark.all
  end
end
