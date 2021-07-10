require 'rails_helper'

RSpec.describe CatCafe do
  describe 'relationships' do
    it { should have_many(:cats) }
  end
end
