class Project < ActiveRecord::Base
  belongs_to :client
  
  has_many :revisions, :dependent => :destroy
  
  validates :name, presence: true
end
