class CreateSubmajors < ActiveRecord::Migration[5.0]
  def change
    create_table :submajors do |t|
      t.string :konsentrasi
      t.references :major, foreign_key: true

      t.timestamps
    end
  end
end
