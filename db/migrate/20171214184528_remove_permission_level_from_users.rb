class RemovePermissionLevelFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :permission_level, :string
  end
end
