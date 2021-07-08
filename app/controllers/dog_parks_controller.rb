class DogParksController < ApplicationController
  def index
    @dog_parks = DogPark.all
  end

  def show
    @dog_park = DogPark.find(params[:id])
  end
end
