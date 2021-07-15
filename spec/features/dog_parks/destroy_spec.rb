require 'rails_helper'

RSpec.describe 'destroying a dog park' do
  it 'can delete the dog park from the index page' do
    park_1 = DogPark.create!(name: "Woofs and Wags",
                            capacity: 25,
                            off_leash: false,
                            food: true)
    park_2 = DogPark.create!(name: "Puppy Prairie",
                            capacity: 50,
                            off_leash: true,
                            food: false)
    dog_1 = Dog.create!(name: 'Alfie',
                            plays_fetch: true,
                            age: 1.5,
                            breed: 'Australian Shepherd',
                            dog_park_id: park_1.id)
    dog_2 = Dog.create!(name: 'Hazel',
                            plays_fetch: true,
                            age: 2,
                            breed: 'Nova Scotia Duck Tolling Retriever',
                            dog_park_id: park_1.id)
    dog_3 = Dog.create!(name: 'Scout',
                            plays_fetch: true,
                            age: 5,
                            breed: 'Labrador Retriever',
                            dog_park_id: park_2.id)

    visit "/dog_parks/#{park_1.id}"

    click_on 'Delete Dog Park'

    expect(current_path).to eq('/dog_parks')
    expect(page).to_not have_content(park_1.name)
    expect(page).to have_content(park_2.name)

    visit '/dogs'

    expect(page).to_not have_content(dog_1.name)
    expect(page).to_not have_content(dog_2.name)
    expect(page).to have_content(dog_3.name)
  end
end
