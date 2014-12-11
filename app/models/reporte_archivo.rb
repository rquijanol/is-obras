class ReporteArchivo < ActiveRecord::Base
  belongs_to :reporte
   validates :reporte_id, presence: true
end
