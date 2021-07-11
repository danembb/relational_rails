require 'rails_helper'

RSpec.describe 'the dog show page' do
  before(:each) do
    @park_1 = DogPark.create!(name: "Woofs and Wags",
                            capacity: 25,
                            off_leash: false,
                            food: true)
    @dog_1 = Dog.create!(name: 'Alfie',
                            plays_fetch: false,
                            age: 1.5,
                            breed: 'Australian Shepherd',
                            dog_park_id: @park_1.id)
    @dog_2 = Dog.create!(name: 'Hazel',
                            plays_fetch: true,
                            age: 2,
                            breed: 'Nova Scotia Duck Tolling Retriever',
                            dog_park_id: @park_1.id)
  end

  it 'displays dog name' do
    visit "/dogs/#{@dog_1.id}"

    expect(page).to have_content(@dog_1.name)
    expect(page).to_not have_content(@dog_2.name)
  end

  it 'displays dog park id' do
    visit "/dogs/#{@dog_1.id}"

    expect(page).to have_content("Dog park id: #{@dog_1.dog_park_id}")
  end

  it 'displays if dog plays fetch' do
    visit "/dogs/#{@dog_1.id}"

    expect(page).to have_content("Plays fetch: #{@dog_1.plays_fetch}")
    expect(page).to_not have_content("Plays fetch: #{@dog_2.plays_fetch}")
  end

  it 'displays dog age' do
    visit "/dogs/#{@dog_1.id}"

    expect(page).to have_content("Age: #{@dog_1.age}")
    expect(page).to_not have_content("Age: #{@dog_2.age}")
  end

  it 'displays dog breed' do
    visit "/dogs/#{@dog_1.id}"

    expect(page).to have_content("Breed: #{@dog_1.breed}")
    expect(page).to_not have_content("Breed: #{@dog_2.breed}")
  end

  it 'displays dog created at' do
    visit "/dogs/#{@dog_1.id}"

    expect(page).to have_content("Created at: #{@dog_1.created_at}")
  end

  it 'displays dog updated at' do
    visit "/dogs/#{@dog_1.id}"

    expect(page).to have_content("Updated at: #{@dog_1.updated_at}")
  end

  it 'links to dog park index' do
    visit "/dogs/#{@dog_1.id}"

    click_on 'Dog Parks Index'

    expect(current_path).to eq('/dog_parks')
  end

  it 'links to dogs index' do
    visit "/dogs/#{@dog_1.id}"

    click_on 'Dogs Index'

    expect(current_path).to eq('/dogs')
  end

  it 'links to update dog page' do
    visit "/dogs/#{@dog_1.id}"

    click_on 'Update Dog'

    expect(current_path).to eq("/dogs/#{@dog_1.id}/edit")
  end
end
