require 'rails_helper'

RSpec.describe 'cat cafe page', type: :feature do
  #For each parent table
  #As a visitor
  #When I visit '/parents'
  #Then I see the name of each parent record in the system
  it 'can see the name cat cafe when visiting /parents' do
    cat_cafe = CatCafe.create!(name: 'Denver Cat Caves', capacity: '21') #assuming default values will generate and be true?

    expect(page).to have_content(cat_cafe.name)
    expect(page).to have_content(cat_cafe.serves_food)

  end
end
