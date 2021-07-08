require 'rails_helper'

RSpec.describe 'Dog index page' do
  before(:each) do
    @park_1 = DogPark.create!(name: 'Woofs and Wags',
                            capacity: 25,
                            off_leash: false,
                            food: true)
    @dog_1 = Dog.create!(name: 'Alfie',
                            plays_fetch: true,
                            age: 1.5,
                            breed: 'Australian Shepherd',
                            dog_park_id: @park_1.id)
    @dog_2 = Dog.create!(name: 'Hazel',
                            plays_fetch: true,
                            age: 2,
                            breed: 'Nova Scotia Duck Tolling Retriever',
                            dog_park_id: @park_1.id)
  end

  it 'can see all dog names' do
    visit '/dogs'

    expect(page).to have_content(@dog_1.name)
    expect(page).to have_content(@dog_2.name)
  end

  it 'can see all dog parks' do
    visit '/dogs'

    expect(page).to have_content("Dog park id: #{@park_1.id}")
  end

  it 'can see if each dog plays fetch' do
    visit '/dogs'

    expect(page).to have_content("Plays fetch: #{@dog_1.plays_fetch}")
    expect(page).to have_content("Plays fetch: #{@dog_2.plays_fetch}")
  end

  it 'can see all dog ages' do
    visit '/dogs'

    expect(page).to have_content("Age: #{@dog_1.age}")
    expect(page).to have_content("Age: #{@dog_2.age}")
  end

  it 'can see all dog breeds' do
    visit '/dogs'

    expect(page).to have_content("Breed: #{@dog_1.breed}")
    expect(page).to have_content("Breed: #{@dog_2.breed}")
  end

  it 'can see all dog created at timestamps' do
    visit '/dogs'

    expect(page).to have_content("Created at: #{@dog_1.created_at}")
    expect(page).to have_content("Created at: #{@dog_2.created_at}")
  end

  it 'can see all dog updated at timestamps' do
    visit '/dogs'

    expect(page).to have_content("Updated at: #{@dog_1.updated_at}")
    expect(page).to have_content("Updated at: #{@dog_2.updated_at}")
  end
end
