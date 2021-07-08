class CatCafesController < ApplicationController
  def index
    @cat_cafes = CatCafe.all
  end
end
