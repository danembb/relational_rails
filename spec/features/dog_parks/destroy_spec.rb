require 'rails_helper'

RSpec.describe 'dstroying a dog park' do
  it 'can delete the dog park from the show page' do
    park_1 = DogPark.create!(name: "Woofs and Wags",
                            capacity: 25,
                            off_leash: false,
                            food: true)

    visit "/dog_parks/#{park_1.id}"

    click_on 'Delete Dog Park'

    expect(current_path).to eq('/dog_parks')
    expect(page).to_not have_content('Woofs and Wags')
  end
end
