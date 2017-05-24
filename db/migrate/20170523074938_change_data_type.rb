class ChangeDataType < ActiveRecord::Migration[5.0]
  def change
    remove_column :members, :hobby
    add_column :members, :hobby, :integer, array: true, default: []
  end
end
