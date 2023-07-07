class BookReviewsPublisherSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :description, :publish_date, :price, :user_id, :poster_url

  belongs_to :publisher
  belongs_to :author
end
