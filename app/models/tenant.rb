class Tenant < ActiveRecord::Base
  has_many :users
  has_many :clients
  has_one :setting
end
