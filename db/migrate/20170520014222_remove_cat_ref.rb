class RemoveCatRef < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :drugs, column: :category_id
  end
end
