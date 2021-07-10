class CatCafesController < ApplicationController
  def index
    @cat_cafes = CatCafe.all
    #@cat_cafes = CatCafe.alphabetical
  end

  def show
    @cat_cafe = CatCafe.find(params[:id])
  end

end
