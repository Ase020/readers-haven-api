class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :star_rating, :description, :book_id, :user_id
end
