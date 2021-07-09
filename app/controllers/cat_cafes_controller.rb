class CatCafesController < ApplicationController
  def index
    @cat_cafes = CatCafe.all
  end

  def show
    @cat_cafe = CatCafe.find(params[:id])
  end
end
