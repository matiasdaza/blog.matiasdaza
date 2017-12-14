class CreatePermissionLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :permission_levels do |t|
      t.string :description

      t.timestamps
    end
  end
end
