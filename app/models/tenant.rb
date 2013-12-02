class Tenant < ActiveRecord::Base
  has_many :users
  has_one :setting
end
