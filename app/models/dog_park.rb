class DogPark < ApplicationRecord
  has_many :dogs

  def dog_count
    self.dogs.count
  end
end
