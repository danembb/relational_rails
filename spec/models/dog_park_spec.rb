require 'rails_helper'

RSpec.describe DogPark do
  it {should have_many :dogs}

  describe 'instance methods' do
    before :each do
      @park_1 = DogPark.create!(name: "Woofs and Wags",
                              capacity: 25,
                              off_leash: false,
                              food: true)
      @park_2 = DogPark.create!(name: "Puppy Prairie",
                              capacity: 50,
                              off_leash: true,
                              food: false)
    end
  end
end
