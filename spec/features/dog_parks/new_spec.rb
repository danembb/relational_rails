require 'rails_helper'

RSpec.describe 'the Dog Park creation' do
  it 'can create a new dog park' do
    visit '/dog_parks'

    expect(page).to_not have_content('Doggy Territory')

    visit '/dog_parks/new'

    fill_in('Name', with: 'Doggy Territory')
    fill_in('Capacity', with: 20)
    fill_in('off_leash', with: false)
    fill_in('food', with: false)
    click_button('Create Dog Park')

    new_dog_park = DogPark.last

    expect(current_path).to eq('/dog_parks')
    expect(new_dog_park.name).to eq('Doggy Territory')
    expect(page).to have_content('Doggy Territory')
    expect(page).to have_content(new_dog_park.capacity)
  end
end
