class DropPermissionLevels < ActiveRecord::Migration[5.1]
  def change
    drop_table :permission_levels
  end
end
