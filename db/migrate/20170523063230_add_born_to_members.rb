class AddBornToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :born, :datetime
  end
end
