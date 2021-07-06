class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.boolean :plays_fetch, default: true
      t.integer :age
      t.string :breed
      t.references :dog_park, foreign_key: true
      t.timestamps

    end
  end
end
