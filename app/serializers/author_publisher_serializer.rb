class AuthorPublisherSerializer < ActiveModel::Serializer
  attributes :id
  # , :author_id, :publisher_id
  has_one :author
  has_one :publisher
end
