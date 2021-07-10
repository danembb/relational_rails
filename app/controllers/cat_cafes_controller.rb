class CatCafesController < ApplicationController
  def index
    @cat_cafes = CatCafe.all
    #@cat_cafes = CatCafe.alphabetical
  end

  def show
    @cat_cafe = CatCafe.find(params[:id])
  end
  # Dane, 7.9: Should the cat cafe cats controller be inside this controller file
  # with a method to control it? (can this happen)
  # def cats
  #   @cat_cafe_cats = CatCafe.all
  #
end
