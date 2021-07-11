require 'rails_helper'

RSpec.describe 'the Dog Park edit' do
  it 'can update the Dog Park' do
    park_1 = DogPark.create!(name: 'Woofs n Wags',
                            capacity: 25,
                            off_leash: false,
                            food: true)

    visit "/dog_parks/#{park_1.id}/edit"

    expect(park_1.name).to_not eq('Woofs and Wags')

    fill_in('name', with: 'Woofs and Wags')
    fill_in('capacity', with: 25)
    fill_in('off_leash', with: false)
    fill_in('food', with: true)
    click_button('Update Dog Park')

    updated_park = DogPark.find(park_1.id)

    expect(current_path).to eq("/dog_parks/#{park_1.id}")
    expect(updated_park.name).to eq('Woofs and Wags')
    expect(page).to have_content('Woofs and Wags')
  end
end
