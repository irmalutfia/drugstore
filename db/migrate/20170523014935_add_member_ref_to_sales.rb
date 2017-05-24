class AddMemberRefToSales < ActiveRecord::Migration[5.0]
  def change
    add_reference :sales, :member, foreign_key: true
  end
end
