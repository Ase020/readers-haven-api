class AuthorPublisherSerializer < ActiveModel::Serializer
  attributes :id
  has_one :author
  has_one :publisher
end
