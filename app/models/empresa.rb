class Empresa < ActiveRecord::Base
  has_many :obras
  validates :nombre, presence: true
end
