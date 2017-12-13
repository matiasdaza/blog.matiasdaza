class AddUserIdToArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :user, foreign_key: true
  end
end
