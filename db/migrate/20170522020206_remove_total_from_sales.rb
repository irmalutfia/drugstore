class RemoveTotalFromSales < ActiveRecord::Migration[5.0]
  def change
    remove_column :sales, :total, :decimal
  end
end
