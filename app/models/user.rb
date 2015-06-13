class User < ActiveRecord::Base
  belongs_to :role
  before_create :set_default_role
  ROLES = [:admin, :user]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   
    def is?( requested_role )
    self.role == requested_role.to_s
  end    
  
  private
  def set_default_role
    self.role ||= Role.find_by_name('user')
  end       
     
  def has_role?(role)
  roles.include?(role)
  end
  
  def roles=(roles)
  roles = [*roles].map { |r| r.to_sym }
  self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
  ROLES.reject do |r|
    ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
  end
  end

end
