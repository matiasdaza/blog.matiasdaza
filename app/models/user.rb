class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #belongs_to :permission_level
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create     :set_permission_level #Para asignar a todos los nuevos usuarios con el Rol básico

  has_many :articles, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  include PermissionsConcern

  private

  def set_permission_level
    self.permission_level = 1 #Si le hubiese puesto create era sin el ||, pero como puse el save
    #es para cuando no esté creado el visits_count así el || es... si es nulo, dale 0, sino nada
    #! Este paso también se pudo haber hecho en la migración con un default, pero esto lo había hecho antes de saberlo.

  end

end
