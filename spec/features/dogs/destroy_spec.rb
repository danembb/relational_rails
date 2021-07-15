require 'rails_helper'

RSpec.describe 'destroying a dog' do
  it 'can delete the dog from the show page' do
    park_1 = DogPark.create!(name: "Woofs and Wags",
                            capacity: 25,
                            off_leash: false,
                            food: true)
    dog_1 = Dog.create!(name: 'Alfie',
                            plays_fetch: false,
                            age: 1.5,
                            breed: 'Australian Shepherd',
                            dog_park_id: park_1.id)

    visit "/dogs/#{dog_1.id}"

    click_on 'Delete Dog'

    expect(current_path).to eq('/dogs')
    expect(page).to_not have_content('Alfie')
  end
end
