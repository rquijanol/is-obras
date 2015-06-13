class User < ActiveRecord::Base
  belongs_to :role
  before_save :assign_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   
  def assign_role
    self.role = Role.find_by name: "User" if self.role.nil?
  end

  def admin?
    self.role.name == "Admin"
  end

  def seller?
    self.role.name == "Supervisor"
  end
  def regular?
    self.role.name == "User"
  end

end
