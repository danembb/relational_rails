class DogParksController < ApplicationController
  def index
    @dog_parks = DogPark.order(:created_at)
  end

  def show
    @dog_park = DogPark.find(params[:id])
  end

  def new
  end

  def create
    DogPark.create(dog_park_params)
    redirect_to '/dog_parks'
  end

  def dog_park_params
    params.permit(:name, :capacity, :off_leash, :food)
  end

  def edit
    @dog_park = DogPark.find(params[:id])
  end

  def update
    dog_park = DogPark.find(params[:id])
    dog_park.update(dog_park_params)
    redirect_to "/dog_parks/#{dog_park.id}"
  end
end
