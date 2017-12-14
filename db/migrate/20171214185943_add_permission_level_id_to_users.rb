class AddPermissionLevelIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :permission_level, foreign_key: true
  end
end
