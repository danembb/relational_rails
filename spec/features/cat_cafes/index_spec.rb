require 'rails_helper'

#Dane, 7/8: Should this be a feature?
RSpec.describe 'cat cafe page', type: :feature do
  #For each parent table
  #As a visitor
  #When I visit '/parents'
  #Then I see the name of each parent record in the system
  it 'can see the name cat cafe when visiting /parents' do
    cat_cafe1 = CatCafe.create!(name: 'Denver Cat Caves', capacity: '22') #assuming default values will generate and be true?
    cat_cafe2 = CatCafe.create!(name: 'The Meowning Sip', capacity: '15')

    visit "/cat_cafes"

    expect(page).to have_content(cat_cafe1.name)
    expect(page).to have_content(cat_cafe2.name)
    expect(page).to have_content(cat_cafe1.serves_food)
    expect(page).to have_content(cat_cafe2.serves_food)

  end
end
