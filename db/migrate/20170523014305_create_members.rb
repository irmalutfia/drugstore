class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :age
      t.integer :age_unit
      t.integer :hobby
      t.text :address
      t.string :phone

      t.timestamps
    end
  end
end
