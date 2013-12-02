class Project < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged


  belongs_to :client
  
  has_many :revisions, :dependent => :destroy
  
  validates :name, presence: true

  def to_param
    name.parameterize
  end
end
