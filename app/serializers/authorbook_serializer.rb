class AuthorbookSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :email, :nationality, :bio, :image_url

  has_many :books
end
