class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :email, :nationality, :bio, :image_url
end
