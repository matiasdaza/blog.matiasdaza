class RemovePermissionLevelIdToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, :permission_level, foreign_key: true
  end
end
