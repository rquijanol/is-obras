class Empresa < ActiveRecord::Base
  has_many :obras , :dependent => :destroy
  validates :nombre, presence: true
end
