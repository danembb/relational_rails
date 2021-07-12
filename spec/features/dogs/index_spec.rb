require 'rails_helper'

RSpec.describe 'Dog index page' do
  before(:each) do
    @park_1 = DogPark.create!(name: 'Woofs and Wags',
                            capacity: 25,
                            off_leash: false,
                            food: true)
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
  end

  describe 'displays dogs and their attributes' do
    it 'can see all dog names' do
      visit '/dogs'

      expect(page).to have_content(@dog_1.name)
      expect(page).to have_content(@dog_2.name)
    end

    it 'can see all dog parks' do
      visit '/dogs'

      expect(page).to have_content("Dog park id: #{@dog_1.dog_park_id}")
      expect(page).to have_content("Dog park id: #{@dog_2.dog_park_id}")
    end

    it 'can see if each dog plays fetch' do
      visit '/dogs'

      expect(page).to have_content("Plays fetch: #{@dog_1.plays_fetch}")
      expect(page).to have_content("Plays fetch: #{@dog_2.plays_fetch}")
    end

    it 'can see all dog ages' do
      visit '/dogs'

      expect(page).to have_content("Age: #{@dog_1.age}")
      expect(page).to have_content("Age: #{@dog_2.age}")
    end

    it 'can see all dog breeds' do
      visit '/dogs'

      expect(page).to have_content("Breed: #{@dog_1.breed}")
      expect(page).to have_content("Breed: #{@dog_2.breed}")
    end

    it 'can see all dog created at timestamps' do
      visit '/dogs'

      expect(page).to have_content("Created at: #{@dog_1.created_at}")
      expect(page).to have_content("Created at: #{@dog_2.created_at}")
    end

    it 'can see all dog updated at timestamps' do
      visit '/dogs'

      expect(page).to have_content("Updated at: #{@dog_1.updated_at}")
      expect(page).to have_content("Updated at: #{@dog_2.updated_at}")
    end
  end

  describe 'hyperlinks' do
    it 'links to dog park index' do
      visit '/dogs'

      click_on 'Dog Parks Index'

      expect(current_path).to eq('/dog_parks')
    end

    it 'links to dogs index' do
      visit '/dogs'

      click_on 'Dogs Index'

      expect(current_path).to eq('/dogs')
    end

    it 'links to edit page for each dog' do
      visit '/dogs'
      click_on 'Update Alfie'

      expect(current_path).to eq("/dogs/#{@dog_1.id}/edit")

      visit '/dogs'
      click_on 'Update Hazel'

      expect(current_path).to eq("/dogs/#{@dog_2.id}/edit")
    end
  end

  describe 'content filtering' do
  it 'does not show dogs that do not play fetch' do
      dog_3 = Dog.create!(name: 'Scout',
                              plays_fetch: false,
                              age: 5,
                              breed: 'Labrador Retriever',
                              dog_park_id: @park_1.id)

      visit '/dogs'

      expect(page).to_not have_content(dog_3.name)
      expect(page).to_not have_content("Age: #{dog_3.age}")
      expect(page).to_not have_content("Breed: #{dog_3.breed}")

      dog_3.update(plays_fetch: true)

      visit '/dogs'

      expect(page).to have_content(dog_3.name)
      expect(page).to have_content("Age: #{dog_3.age}")
      expect(page).to have_content("Breed: #{dog_3.breed}")
    end
  end
end
