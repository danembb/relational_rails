require 'rails_helper'

RSpec.describe 'Cat index page' do
  describe 'relationships' do
    it { should belong_to(:cat_cafe) }
  end

  before(:each) do
    @cat_1 = Dog.create!(name: 'Bb',
                         friendly: true,
                         age: 5,
                         color: 'White and black')
  end


end
