class AddSexToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :sex, :integer
  end
end
