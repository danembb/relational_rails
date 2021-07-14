class DogsController < ApplicationController
  def index
    @dogs = Dog.where(plays_fetch: true)
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    dog = Dog.find(params[:id])
    dog.update(dog_params)
    redirect_to "/dogs/#{dog.id}"
  end

  def destroy
    dog = Dog.find(params[:id])
    dog.destroy
    redirect_to '/dogs'
  end

private
  def dog_params
    params.permit(:name, :plays_fetch, :age, :breed, :dog_park_id)
  end
end
