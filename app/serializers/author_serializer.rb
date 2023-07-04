class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :email, :nationality, :bio
end
