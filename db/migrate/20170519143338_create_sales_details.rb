class CreateSalesDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :sales_details do |t|
      t.integer :qty
      t.references :drug, foreign_key: true
      t.references :sale, foreign_key: true
      t.references :prescription, foreign_key: true

      t.timestamps
    end
  end
end
