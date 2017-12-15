class AddCoverToArticles < ActiveRecord::Migration[5.1]
  def change
    add_attachment :articles, :cover
  end
end
