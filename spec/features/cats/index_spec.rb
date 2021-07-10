require 'rails_helper'

RSpec.describe 'cat index page' do
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes:
  before(:each) do
    @cat_cafe1 = CatCafe.create!(name: "Denver Cat Caves",
                                 capacity: "22"
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

  end

  it 'can see cat cafe' do
    visit '/cats'
    expect(page).to have_content("Cat cafe id: #{@cat_cafe1.id}")
  end

  it 'can see cat names' do
    visit '/cats'
    expect(page).to have_content(@cat_1.name)
    expect(page).to have_content(@cat_2.name)
  end

  it 'can see if cats are friendly' do
    visit '/cats'
    expect(page).to have_content(@cat_1.friendly)
    expect(page).to have_content(@cat_2.friendly)
  end

  it 'can see all cats ages' do
    visit '/cats'
    expect(page).to have_content(@cat_1.age)
    expect(page).to have_content(@cat_2.age)
  end

  it 'can see all cats color' do
    visit '/cats'
    expect(page).to have_content(@cat_1.color)
    expect(page).to have_content(@cat_2.color)
  end

  it 'can see cat cafe id' do
    visit '/cats'
    expect(page).to have_content(@cat_1.cat_cafe_id)
  end
end
