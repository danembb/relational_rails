require 'rails_helper'

RSpec.describe 'the Dog  edit' do
  it 'can update the Dog' do
    park_1 = DogPark.create!(name: "Woofs and Wags",
                            capacity: 25,
                            off_leash: false,
                            food: true)
    dog_1 = Dog.create!(name: 'Alfredo',
                            plays_fetch: true,
                            age: 1.5,
                            breed: 'Australian Shepherd',
                            dog_park_id: park_1.id)

    visit "/dogs/#{dog_1.id}/edit"

    expect(dog_1.name).to_not eq('Alfie')

    fill_in('name', with: 'Alfie')
    fill_in('plays_fetch', with: true)
    fill_in('age', with: 1.5)
    fill_in('breed', with: 'Australian Shepherd')
    click_button('Update Dog')

    updated_dog = Dog.find(dog_1.id)

    expect(current_path).to eq("/dogs/#{dog_1.id}")
    expect(updated_dog.name).to eq('Alfie')
    expect(page).to have_content('Alfie')
  end
end
