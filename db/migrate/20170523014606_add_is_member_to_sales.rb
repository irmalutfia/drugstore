class AddIsMemberToSales < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :is_member, :boolean
  end
end
