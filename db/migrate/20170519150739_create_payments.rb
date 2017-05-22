class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :invoice
      t.decimal :total
      t.datetime :date
      t.integer :status
      t.references :purchase, foreign_key: true

      t.timestamps
    end
  end
end
