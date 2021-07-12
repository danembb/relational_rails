require "rails_helper"

RSpec.describe "cat cafe index page" do
  #For each parent table
  #As a visitor
  #When I visit "/parents"
  #Then I see the name of each parent record in the system
  #--------------------------------------------------------#
  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created

  before :each do
    @mocktime_1 = Time.now.midday
    @mocktime_2 = Time.now.midnight
    @cat_cafe1 = CatCafe.create!(name: "Denver Cat Caves", capacity: "22", created_at: @mocktime_1) #assuming default values will generate and be true?
    @cat_cafe2 = CatCafe.create!(name: "The Meowning Sip", capacity: "15", created_at: @mocktime_2)
  end
  it "can see the name cat cafe when visiting /parents" do


    visit "/cat_cafes"
    save_and_open_page
    expect(page).to have_content(cat_cafe1.name)
    expect(page).to have_content(cat_cafe2.name)
    expect(page).to have_content(cat_cafe1.serves_food)
    expect(page).to have_content(cat_cafe2.serves_food)

  end
end
