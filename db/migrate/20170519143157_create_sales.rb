class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.datetime :date
      t.decimal :total
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
