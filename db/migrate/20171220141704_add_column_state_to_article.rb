class AddColumnStateToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :state, :string, default: "in_draft"
  end
end
