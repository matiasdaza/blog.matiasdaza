class AddPermisionlevelToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :permission_level, :integer
  end
end
