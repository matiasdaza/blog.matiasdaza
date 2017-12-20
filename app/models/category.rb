class Category < ApplicationRecord
  has_many :has_categories, dependent: :delete_all
  has_many :articles, through: :has_categories, dependent: :delete_all
end
