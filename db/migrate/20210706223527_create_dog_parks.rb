class CreateDogParks < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_parks do |t|
      t.string :name
      t.integer :capacity
      t.boolean :off_leash
      t.boolean :food
      t.timestamps
    end
  end
end
