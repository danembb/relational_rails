require 'rails_helper'

RSpec.describe 'destroying a dog park' do
  it 'can delete the dog park from the index page' do
    park_1 = DogPark.create!(name: 'Woofs and Wags',
                            capacity: 25,
                            off_leash: false,
                            food: true)
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

    visit "/dog_parks/#{park_1.id}"

    click_on 'Delete Dog Park'

    expect(current_path).to eq('/dog_parks')
    expect(page).to_not have_content('Woofs and Wags')
  end
end
