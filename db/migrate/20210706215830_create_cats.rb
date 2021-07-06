class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.boolean :friendly, default: true
      t.integer :age
      t.string :color
      t.references :cat_cafe, foreign_key: true
      t.timestamps
    end
  end
end
