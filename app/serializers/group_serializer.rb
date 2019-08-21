class GroupSerializer < ActiveModel::Serializer
  has_many  :messages
  attributes :title
end
