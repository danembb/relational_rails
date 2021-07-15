require 'rails_helper'

RSpec.describe DogPark do
  it {should have_many :dogs}

  describe 'instance methods' do
    before(:each) do
      @park_1 = DogPark.create!(name: "Woofs and Wags",
                              capacity: 25,
                              off_leash: false,
                              food: true)
      @park_2 = DogPark.create!(name: "Puppy Prairie",
                              capacity: 50,
                              off_leash: true,
                              food: false)
      @dog_1 = Dog.create!(name: 'Alfie',
                              plays_fetch: true,
                              age: 1.5,
                              breed: 'Australian Shepherd',
                              dog_park_id: @park_1.id)
      @dog_2 = Dog.create!(name: 'Hazel',
                              plays_fetch: true,
                              age: 2,
                              breed: 'Nova Scotia Duck Tolling Retriever',
                              dog_park_id: @park_1.id)
      @dog_3 = Dog.create!(name: 'Scout',
                              plays_fetch: false,
                              age: 5,
                              breed: 'Labrador Retriever',
                              dog_park_id: @park_2.id)
      @dog_4 = Dog.create!(name: 'Hank',
                              plays_fetch: true,
                              age: 8,
                              breed: 'Australian Shepherd',
                              dog_park_id: @park_1.id)
    end

    it 'returns dog count in a park' do
      expect(@park_1.dog_count).to eq(3)
      expect(@park_2.dog_count).to eq(1)
    end

    it 'returns dogs older than a given age' do
      expect(@park_1.age_filter(2)).to eq([@dog_4])
      expect(@park_1.age_filter(1)).to eq([@dog_2, @dog_4])
    end
  end
end
