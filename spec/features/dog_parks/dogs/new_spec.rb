require 'rails_helper'

RSpec.describe 'the Dog Park creation' do
  it 'can create a new dog' do
    park_1 = DogPark.create!(name: "Woofs and Wags",
                            capacity: 25,
                            off_leash: false,
                            food: true)

    visit "/dog_parks/#{park_1.id}/dogs"

    expect(page).to_not have_content('Hank')

    visit "/dog_parks/#{park_1.id}/dogs/new"

    fill_in('name', with: 'Hank')
    fill_in('plays_fetch', with: true)
    fill_in('age', with: 8)
    fill_in('breed', with: 'Australian Shepherd')
    click_button('Create Dog')

    new_dog = Dog.last

    expect(current_path).to eq("/dog_parks/#{park_1.id}/dogs")
    expect(new_dog.name).to eq('Hank')
    expect(page).to have_content('Hank')
    expect(page).to have_content(new_dog.age)
  end
end
