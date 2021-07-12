class DogParkDogsController < ApplicationController
  def index
    @dog_park = DogPark.find(params[:dog_park_id])
    @dogs = @dog_park.dogs
  end
end
