require 'rails_helper'

RSpec.describe Cat do
  describe 'relationships' do
    it { should belong_to(:cat_cafe) }
  end


end
