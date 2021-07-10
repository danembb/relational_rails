require 'rails_helper'

RSpec.describe 'cat show page' do
  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes:
  before :each do
    @cat_cafe1 = CatCafe.create!(name: "Denver Cat Caves",
                                 capacity: "22")
    @cat_1 = Cat.create!(name: 'Bb',
                         friendly: true,
                         age: 5,
                         color: 'White and black',
                         cat_cafe_id: @cat_cafe1.id)
    @cat_2 = Cat.create!(name: 'Nico',
                         friendly: true,
                         age: 6,
                         color: 'Black and white',
                         cat_cafe_id: @cat_cafe1.id)
  end
end
