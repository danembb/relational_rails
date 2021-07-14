class DogPark < ApplicationRecord
  has_many :dogs

  def dog_count
    dogs.count
  end

  def age_filter(age)
    dogs.where("age > ?", age)
  end
end
