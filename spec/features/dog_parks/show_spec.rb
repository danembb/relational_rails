require 'rails_helper'

RSpec.describe 'the dog park show page' do
  before(:each) do
    @park_1 = DogPark.create!(name: "Woofs and Wags",
                            capacity: 25,
                            off_leash: false,
                            food: true)
    @park_2 = DogPark.create!(name: "Puppy Prairie",
                            capacity: 50,
                            off_leash: true,
                            food: false)
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
    @dog_3 = Dog.create!(name: 'Scout',
                            plays_fetch: false,
                            age: 5,
                            breed: 'Labrador Retriever',
                            dog_park_id: @park_2.id)
  end

  it 'displays the dog park name' do
    visit "/dog_parks/#{@park_1.id}"

    expect(page).to have_content(@park_1.name)
    expect(page).to_not have_content(@park_2.name)
  end

  it 'displays the dog park capacity' do
    visit "/dog_parks/#{@park_1.id}"

    expect(page).to have_content(@park_1.capacity)
    expect(page).to_not have_content(@park_2.capacity)
  end

  it 'displays if the dog park is off leash' do
    visit "/dog_parks/#{@park_1.id}"

    expect(page).to have_content("Off Leash Park: #{@park_1.off_leash}")
    expect(page).to_not have_content("Off Leash Park: #{@park_2.off_leash}")
  end

  it 'displays if the dog park provides food' do
    visit "/dog_parks/#{@park_1.id}"

    expect(page).to have_content("Food for sale: #{@park_1.food}")
    expect(page).to_not have_content("Food for sale: #{@park_2.food}")
  end

  it 'displays dog park created at' do
    visit "/dog_parks/#{@park_1.id}"

    expect(page).to have_content("Created at: #{@park_1.created_at}")
  end

  it 'displays dog park updated at' do
    visit "/dog_parks/#{@park_1.id}"

    expect(page).to have_content("Created at: #{@park_1.updated_at}")
  end

  it 'displays count dogs in the dog park' do
    visit "/dog_parks/#{@park_1.id}"

    expect(page).to have_content("Dog count: #{@park_1.dog_count}")
  end
end
