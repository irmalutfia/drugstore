class CreatePrescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :prescriptions do |t|
      t.string :nama_dokter
      t.string :nama_apoteker

      t.timestamps
    end
  end
end
