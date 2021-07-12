class CatCafe < ApplicationRecord
  has_many :cats

  def cat_count
    self.cats.count
  end
end
