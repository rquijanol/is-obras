class Obra < ActiveRecord::Base
  belongs_to :empresa
  has_many :reportes, :dependent => :destroy
  
  #before_save :calcula_plazo
  
  validates :nombre, presence: true
  validates :empresa_id, presence: true
  validate :fechafinal_cannot_be_earlier_than_fechainicial
  validates :fechainicial, presence: true
  validates :fechafinal, presence: true
  
  def fechafinal_cannot_be_earlier_than_fechainicial
    errors.add(:fechafinal, "La fecha final no puede ser menor a la inicial") if
      !fechafinal.blank? and !fechainicial.blank? and fechafinal < fechainicial
  end
  
  
  def plazo
     (self.fechafinal - self.fechainicial).to_i unless (self.fechafinal.blank? || self.fechainicial.blank?)
  end
  
end
