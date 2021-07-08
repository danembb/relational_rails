require 'rails_helper'

RSpec.describe "Dog parks index page" do
  it "can see all dog park names" do
    park_1 = DogPark.create!(name: "Woofs and Wags",
                            capacity: 25,
                            off_leash: false,
                            food: true)
    park_2 = DogPark.create!(name: "Puppy Prairie",
                            capacity: 50,
                            off_leash: true,
                            food: false)

    visit "/dog_parks"

    expect(page).to have_content(park_1.name)
    expect(page).to have_content(park_2.name)
    expect(page).to_not have_content(park_1.capacity)
    expect(page).to_not have_content(park_2.capacity)
    expect(page).to_not have_content(park_1.off_leash)
    expect(page).to_not have_content(park_2.off_leash)
    expect(page).to_not have_content(park_1.food)
    expect(page).to_not have_content(park_2.food)
  end
end
