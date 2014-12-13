class Reporte < ActiveRecord::Base
  belongs_to :obra
  default_scope -> { order(created_at: :desc) }
  has_many :reporte_detalles, dependent: :destroy
  has_many :reporte_archivos, dependent: :destroy
  
  accepts_nested_attributes_for :reporte_archivos,  :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :reporte_detalles,  :reject_if => :all_blank, :allow_destroy => true
  
  validates :obra_id, presence: true
  
end
