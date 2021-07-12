require 'rails_helper'

RSpec.describe 'cat cafe cats index page' do
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes:
  before :each do
    @cat_cafe1 = CatCafe.create!(name: "Denver Cat Caves",
                                 capacity: "22"
                                )

    @cat_cafe2 = CatCafe.create!(name: "The Meowning Sip",
                                 capacity: "15"
                                )

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
                         friendly: false,
                         age: 1,
                         color: 'Black and brown',
                         cat_cafe_id: @cat_cafe2.id
                        )
  end

  it 'can display the cat cafe' do
    visit "/cat_cafes/#{@cat_cafe1.id}/cats"

    expect(page).to have_content(@cat_cafe1.name)
  end

  it 'can display the name of each cat associated with the cat cafe' do
    visit "/cat_cafes/#{@cat_cafe1.id}/cats"
    expect(page).to have_content(@cat_1.name)
    expect(page).to have_content(@cat_2.name)
    expect(page).to_not have_content(@cat_3.name)
  end

  it 'can see if each cat is friendly' do
    visit "/cat_cafes/#{@cat_cafe1.id}/cats"

    expect(page).to have_content(@cat_1.friendly)
    expect(page).to have_content(@cat_2.friendly)
    expect(page).to_not have_content(@cat_3.friendly)
  end

  it 'can see each cats age' do
    visit "/cat_cafes/#{@cat_cafe1.id}/cats"
    expect(page).to have_content(@cat_1.age)
    #Dane, 7.9: This test fails *sometimes* when the cat_cafe_id is generated with a "1" in it.
    expect(page).to have_content(@cat_2.age)
    expect(page).to_not have_content(@cat_3.age)
  end

  it 'can see each cats color' do
    visit "/cat_cafes/#{@cat_cafe1.id}/cats"
    expect(page).to have_content(@cat_1.color)
    expect(page).to have_content(@cat_2.color)
    expect(page).to_not have_content(@cat_3.color)
  end

  it 'can each cats cat cafe id' do
    visit "/cat_cafes/#{@cat_cafe1.id}/cats"
    expect(page).to have_content(@cat_1.cat_cafe_id)
    expect(page).to have_content(@cat_2.cat_cafe_id)
    expect(page).to_not have_content(@cat_3.cat_cafe_id)
  end

  it 'links to cat cafe index page' do
    visit "/cat_cafes/#{@cat_cafe1.id}/cats"

    click_on 'Cat Cafes Index'

    expect(current_path).to eq('/cat_cafes')
  end

  it 'links to cats index' do
    visit "/cat_cafes/#{@cat_cafe1.id}/cats"

    click_on 'Cats Index'

    expect(current_path).to eq('/cats')
  end
end
