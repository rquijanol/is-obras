class Reporte < ActiveRecord::Base
  include Filterable
  belongs_to :obra
  default_scope -> { order(created_at: :desc) }
  has_many :reporte_detalles, dependent: :destroy
  has_many :reporte_archivos, dependent: :destroy
  
  accepts_nested_attributes_for :reporte_archivos
  accepts_nested_attributes_for :reporte_detalles
  
  validates :obra_id, presence: true
  
#  def initialize(obra_id)
#    @obra_id=obra_id
#  end
end
