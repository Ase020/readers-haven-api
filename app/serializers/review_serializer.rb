class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :star_rating, :description, :book_id, :user_id
  belongs_to :user
end
