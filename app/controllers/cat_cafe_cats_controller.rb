class CatCafeCatsController < ApplicationController

  def index
    @cat_cafe = CatCafe.find(params[:cat_cafe_id])
    @cats = @cat_cafe.cats
  end
end
