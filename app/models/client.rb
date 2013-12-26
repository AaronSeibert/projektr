class Client < ActiveRecord::Base
  has_many :projects
  has_many :users
  belongs_to :tenant
  
  validates :name, presence: true
end
