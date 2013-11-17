class Organization < ActiveRecord::Base
  resourcify
  has_many :membership_types
  has_many :memberships
  has_many :users, through: :memberships
  
  class << self
  end  

  def active_members
    # users.active
  end
end
