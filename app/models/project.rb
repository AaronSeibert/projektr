class Project < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, :use => [:slugged]
  
  belongs_to :client
  belongs_to :tenant
  
  has_many :revisions, :dependent => :destroy
  has_and_belongs_to_many :users
  
  validates :name, presence: true
  validates :client, presence: true
  
  def slug_candidates
    [
      [self.client.name, :name],
      [self.client.name, :name, Time.now.year],
      [self.client.name, :name, Time.now.year, Time.now.month],
      [self.client.name, :name, Time.now.year, Time.now.month, Time.now.day],
    ]
  end
  
  def to_param
    name.parameterize
  end
  
  def should_generate_new_friendly_id?
    name_changed?
  end
end
