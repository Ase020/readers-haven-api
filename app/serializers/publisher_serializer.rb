class PublisherSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :email, :telephone
end
