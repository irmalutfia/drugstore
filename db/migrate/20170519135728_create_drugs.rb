class CreateDrugs < ActiveRecord::Migration[5.0]
  def change
    create_table :drugs do |t|
      t.string :name
      t.integer :stock
      t.string :unit
      t.decimal :price
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
