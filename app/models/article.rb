class Article < ApplicationRecord
  #Al crear el modelo, asocia directamente la tabla como Articles (el modelo en plural)
  validates :title, presence:true, uniqueness: true
  validates :body, presence:true, length: {minimum: 20}

end
