require 'rails_helper'

RSpec.describe 'cat cafe show page' do
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table
  before(:each) do
    @cat_cafe1 = CatCafe.create!(name: "Denver Cat Caves", capacity: "22")
    @cat_cafe2 = CatCafe.create!(name: "The Meowning Sip", capacity: "15")
  end

  it 'displays the cat cafe name' do

    visit "/cat_cafes/#{@cat_cafe1.id}"

    expect(page).to have_content(@cat_cafe1.name)
    expect(page).to_not have_content(@cat_cafe2.name)
  end

  it 'displays the cat cafe capacity' do
    visit "/cat_cafes/#{@cat_cafe1.id}"

    expect(page).to have_content(@cat_cafe1.capacity)
    expect(page).to_not have_content(@cat_cafe2.capacity)
  end

  it 'displays if the cat cafe serves food' do
    visit "/cat_cafes/#{@cat_cafe1.id}"

    expect(page).to have_content("Serves Food: #{@cat_cafe1.serves_food}")
    expect(page).to_not have_content("Serves Food: #{@cat_cafe2.serves_food}")
  end

  it 'displays if the cat cafe is adopting' do
    visit "/cat_cafes/#{@cat_cafe1.id}"

    expect(page).to have_content("Adopting?: #{@cat_cafe1.adopting}")
    expect(page).to_not have_content("Adopting?: #{@cat_cafe2.adopting}")
  end
end
