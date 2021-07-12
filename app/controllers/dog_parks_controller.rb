class DogParksController < ApplicationController
  def index
    @dog_parks = DogPark.order(:created_at)
  end

  def show
    @dog_park = DogPark.find(params[:id])
  end
end
