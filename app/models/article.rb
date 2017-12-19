class Article < ApplicationRecord
  #Al crear el modelo, asocia directamente la tabla como Articles (el modelo en plural)
  belongs_to        :user
  has_many          :comments
  has_many          :has_categories
  has_many          :categories, through: :has_categories

  validates         :title, presence:true, uniqueness: true
  validates         :body, presence:true, length: {minimum: 20}
  before_create     :set_visits_count
  after_create      :save_categories

  #paperclip

  has_attached_file :cover, styles: {medium: "1280x720", thumb:"750x300", mini: "900x300"}
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/#por seguridad

  def categories=(value) #Custom setter
		@categories = value
	end

  def update_visits_count
    self.update(visits_count: self.visits_count + 1)
  end

  private

  def save_categories
		@categories.each do |category_id|
			HasCategory.create(category_id: category_id, article_id: self.id)
		end
	end

  def set_visits_count
    self.visits_count ||= 0 #Si le hubiese puesto create era sin el ||, pero como puse el save
    #es para cuando no esté creado el visits_count así el || es... si es nulo, dale 0, sino nada
  end

end
