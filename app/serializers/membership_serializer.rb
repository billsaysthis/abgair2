class MembershipSerializer <; ActiveModel::Serializer
  attributes :user_id, :organization_id, :expires_at, :membership_type_id
end