class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :genre, :description, :publish_date, :author_id, :price, :user_id, :poster_url

  # has_many :reviews
  # belongs_to :publisher
end