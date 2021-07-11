class DogParkDogsController < ApplicationController
  def index
    @dog_park = DogPark.find(params[:dog_park_id])
    if params[:alpha] == 'true'
      @dogs = @dog_park.dogs.order(:name)
    else
      @dogs = @dog_park.dogs
    end
  end

  def new
    @dog_park = DogPark.find(params[:dog_park_id])
  end

  def create
    dog = Dog.create(dog_params)
    redirect_to "/dog_parks/#{dog.dog_park_id}/dogs"
  end

private
  def dog_params
    params.permit(:name, :plays_fetch, :age, :breed, :dog_park_id)
  end
end
