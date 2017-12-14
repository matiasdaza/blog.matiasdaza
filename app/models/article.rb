class Article < ApplicationRecord
  #Al crear el modelo, asocia directamente la tabla como Articles (el modelo en plural)
  belongs_to        :user
  validates         :title, presence:true, uniqueness: true
  validates         :body, presence:true, length: {minimum: 20}
  before_create     :set_visits_count
  has_many          :comments

  def update_visits_count
    self.update(visits_count: self.visits_count + 1)
  end

  private

  def set_visits_count
    self.visits_count ||= 0 #Si le hubiese puesto create era sin el ||, pero como puse el save
    #es para cuando no esté creado el visits_count así el || es... si es nulo, dale 0, sino nada
  end

end
