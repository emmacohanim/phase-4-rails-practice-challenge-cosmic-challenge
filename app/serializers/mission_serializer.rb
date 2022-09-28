class MissionSerializer < ActiveModel::Serializer
  attributes :id, :name, :planet
  has_one :scientist
  has_one :planet
end
