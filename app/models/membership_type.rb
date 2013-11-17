class MembershipType < ActiveRecord::Base
  belongs_to :organization
  has_many :memberships
end
