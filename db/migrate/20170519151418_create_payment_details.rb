class CreatePaymentDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_details do |t|
      t.datetime :date
      t.decimal :cash
      t.decimal :debt
      t.integer :qty
      t.string :unit
      t.references :drug, foreign_key: true
      t.references :payment, foreign_key: true

      t.timestamps
    end
  end
end
