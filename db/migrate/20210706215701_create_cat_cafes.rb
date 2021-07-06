class CreateCatCafes < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_cafes do |t|
      t.string :name
      t.integer :capacity
      t.boolean :serves_food, default: false
      t.boolean :adopting, default: true
      t.timestamps
    end
  end
end
