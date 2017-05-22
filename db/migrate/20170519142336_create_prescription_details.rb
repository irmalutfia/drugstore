class CreatePrescriptionDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :prescription_details do |t|
      t.integer :qty
      t.decimal :price
      t.references :drug, foreign_key: true
      t.references :prescription, foreign_key: true

      t.timestamps
    end
  end
end
