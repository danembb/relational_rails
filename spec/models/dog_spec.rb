require 'rails_helper'

RSpec.describe Dog do
  it {should belong_to :dog_park}
end
