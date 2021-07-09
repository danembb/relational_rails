require 'rails_helper'

RSpec.describe 'Dog parks index page' do
  before(:each) do
    stubtime_1 = Time.now.midnight
    stubtime_2 = Time.now.midday

    @park_1 = DogPark.create!(name: 'Woofs and Wags',
                            capacity: 25,
                            off_leash: false,
                            food: true,
                            created_at: stubtime_2)
    @park_2 = DogPark.create!(name: 'Puppy Prairie',
                            capacity: 50,
                            off_leash: true,
                            food: false,
                            created_at: stubtime_1)
  end
  it 'shows all dog park names' do
    visit '/dog_parks'

    expect(page).to have_content(@park_1.name)
    expect(page).to have_content(@park_2.name)
    expect(page).to_not have_content(@park_1.capacity)
    expect(page).to_not have_content(@park_2.capacity)
    expect(page).to_not have_content(@park_1.off_leash)
    expect(page).to_not have_content(@park_2.off_leash)
    expect(page).to_not have_content(@park_1.food)
    expect(page).to_not have_content(@park_2.food)
  end

  it 'shows all dog park created at' do
    visit '/dog_parks'

    expect(page).to have_content(@park_1.created_at)
    expect(page).to have_content(@park_2.created_at)
  end

  it 'lists dog parks in order by created at'
end
