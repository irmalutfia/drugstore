class AddQtyPriceToSalesDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :sales_details, :price, :decimal
  end
end
