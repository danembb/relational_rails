require 'rails_helper'

RSpec.describe 'cat cafe show page' do
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table
  before(:each) do
    @cat_cafe1 = CatCafe.create!(name: "Denver Cat Caves", capacity: "22")
    @cat_cafe2 = CatCafe.create!(name: "The Meowning Sip", capacity: "15")
    @cat_1 = Cat.create!(name: 'Bb',
                         friendly: true,
                         age: 5,
                         color: 'White and black',
                         cat_cafe_id: @cat_cafe1.id
                        )
    @cat_2 = Cat.create!(name: 'Nico',
                         friendly: true,
                         age: 6,
                         color: 'Black and white',
                         cat_cafe_id: @cat_cafe1.id
                        )
    @cat_3 = Cat.create!(name: 'Arkham',
                         friendly: true,
                         age: 1,
                         color: 'Black and brown',
                         cat_cafe_id: @cat_cafe2.id
                        )
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
    expect(page).to_not have_content("Serves Food: true")
  end

  it 'displays if the cat cafe is adopting' do
    visit "/cat_cafes/#{@cat_cafe1.id}"

    expect(page).to have_content("Adopting?: #{@cat_cafe1.adopting}")
    expect(page).to_not have_content("Adopting?: false")
  end

  it 'displays cat cafe created at attribute' do
    visit "/cat_cafes/#{@cat_cafe1.id}"

    expect(page).to have_content("Created at: #{@cat_cafe1.created_at}")
  end

  it 'displays cat cafe updated at attribute' do
    visit "/cat_cafes/#{@cat_cafe1.id}"

    expect(page).to have_content("Created at: #{@cat_cafe1.updated_at}")
  end

  it 'displays count cats in the cat cafe' do
    visit "/cat_cafes/#{@cat_cafe1.id}"

    expect(page).to have_content("Cat Count: #{@cat_cafe1.cat_count}")
  end

  it 'links to cat cafes index' do
    visit '/cat_cafes'

    click_on 'Cat Cafes Index'

    expect(current_path).to eq('/cat_cafes')
  end

  it 'links to cats index' do
    visit '/cats'

    click_on 'Cats Index'

    expect(current_path).to eq('/cats')
  end
end
