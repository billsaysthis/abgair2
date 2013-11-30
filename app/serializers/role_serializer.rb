class RoleSerializer < ActiveModel::Serializer
  attributes :name, :resource_id, :resource_type
end