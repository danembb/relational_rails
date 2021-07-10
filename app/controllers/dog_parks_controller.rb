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
end
