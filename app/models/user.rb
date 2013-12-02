class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :tenant
  
  def is_admin?
    self.admin
  end
  def is_superuser?
    self.superuser
  end
end
