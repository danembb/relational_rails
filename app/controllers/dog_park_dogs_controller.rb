class DogParkDogsController < ApplicationController
  def index
    @dog_park = DogPark.find(params[:dog_park_id])
    @dogs = @dog_park.dogs
  end

  def new
    @dog_park = DogPark.find(params[:dog_park_id])
  end

  def create
    dog = Dog.create(dog_params)
    redirect_to "/dog_parks/#{dog.dog_park_id}/dogs"
  end

  def dog_params
    params.permit(:name, :plays_fetch, :age, :breed, :dog_park_id)
  end
end
