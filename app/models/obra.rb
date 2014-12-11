class Obra < ActiveRecord::Base
  belongs_to :empresa
  has_many :reportes
  
  before_save :calcula_plazo
  
  validates :nombre, presence: true
  validates :empresa_id, presence: true
  validate :fechafinal_cannot_be_earlier_than_fechainicial
  validate :fechainicial, presence: true
  validate :fechafinal, presence: true
  
  def fechafinal_cannot_be_earlier_than_fechainicial
    errors.add(:fechafinal, "La fecha final no puede ser menor a la inicial") if
      !fechafinal.blank? and !fechainicial.blank? and fechafinal < fechainicial
  end
  
  
  def calcula_plazo
    unless !self.fechafinal.blank? || !self.fechainicial.blank?
      self.plazo = (self.fechafinal - self.fechainicial).to_i
    end
  end
  
end
