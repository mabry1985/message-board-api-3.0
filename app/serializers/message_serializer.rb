class MessageSerializer < ActiveModel::Serializer

  attributes :id, :author, :title, :content
end
