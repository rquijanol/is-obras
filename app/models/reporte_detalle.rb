class ReporteDetalle < ActiveRecord::Base
  belongs_to :reporte
  validates_presence_of :numeropersonas, :categoria
 
end
