class ReporteDetalle < ActiveRecord::Base
  belongs_to :reporte
  validates_presence_of :numeropersonas, :categoria
  enum categoria: [:Sobrestante,:Oficial,:Soldador, :Ayudante, :Buzo, :Chofer, :Otro]
end
