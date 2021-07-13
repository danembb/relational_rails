require 'rails_helper'

RSpec.describe 'Dog parks dogs index' do
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
  end
  describe 'displays dog park dogs and their attributes' do
    it 'shows dog park name' do
      visit "/dog_parks/#{@park_1.id}/dogs"

      expect(page).to have_content(@park_1.name)
    end

    it 'shows all dog names' do
      visit "/dog_parks/#{@park_1.id}/dogs"

      expect(page).to have_content(@dog_1.name)
      expect(page).to have_content(@dog_2.name)
      expect(page).to_not have_content(@dog_3.name)
    end

    it 'shows if each dog plays fetch' do
      visit "/dog_parks/#{@park_1.id}/dogs"

      expect(page).to have_content("Plays fetch: #{@dog_1.plays_fetch}")
      expect(page).to have_content("Plays fetch: #{@dog_2.plays_fetch}")
      expect(page).to_not have_content("Plays fetch: #{@dog_3.plays_fetch}")
    end

    it 'shows all dog ages' do
      visit "/dog_parks/#{@park_1.id}/dogs"

      expect(page).to have_content("Age: #{@dog_1.age}")
      expect(page).to have_content("Age: #{@dog_2.age}")
      expect(page).to_not have_content("Age: #{@dog_3.age}")
    end

    it 'shows all dog breeds' do
      visit "/dog_parks/#{@park_1.id}/dogs"

      expect(page).to have_content("Breed: #{@dog_1.breed}")
      expect(page).to have_content("Breed: #{@dog_2.breed}")
      expect(page).to_not have_content("Breed: #{@dog_3.breed}")
    end

    it 'shows all dog created at timestamps' do
      visit "/dog_parks/#{@park_1.id}/dogs"

      expect(page).to have_content("Created at: #{@dog_1.created_at}")
      expect(page).to have_content("Created at: #{@dog_2.created_at}")
    end

    it 'shows all dog updated at timestamps' do
      visit "/dog_parks/#{@park_1.id}/dogs"

      expect(page).to have_content("Updated at: #{@dog_1.updated_at}")
      expect(page).to have_content("Updated at: #{@dog_2.updated_at}")
    end
  end

  describe 'hyperlinks' do
    it 'links to dog park index' do
      visit "/dog_parks/#{@park_1.id}/dogs"

      click_on 'Dog Parks Index'

      expect(current_path).to eq('/dog_parks')
    end

    it 'links to dogs index' do
      visit "/dog_parks/#{@park_1.id}/dogs"

      click_on 'Dogs Index'

      expect(current_path).to eq('/dogs')
    end

    it 'links to create dog page' do
      visit "/dog_parks/#{@park_1.id}/dogs"

      click_on 'Create Dog'

      expect(current_path).to eq("/dog_parks/#{@park_1.id}/dogs/new")
    end
  end

  describe 'content filtering' do
    it 'sorts page alphabetically' do
      dog_4 = Dog.create!(name: 'Hank',
                              plays_fetch: true,
                              age: 8,
                              breed: 'Australian Shepherd',
                              dog_park_id: @park_1.id)

      visit "/dog_parks/#{@park_1.id}/dogs"

      expect(page.text.index("Alfie")).to be < page.text.index("Hazel")
      expect(page.text.index("Hazel")).to be < page.text.index("Hank")

      click_on 'Sort Alphabetically'

      expect(page.text.index("Alfie")).to be < page.text.index("Hank")
      expect(page.text.index("Hank")).to be < page.text.index("Hazel")
    end
  end
end
