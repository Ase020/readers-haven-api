class Book < ApplicationRecord
  belongs_to :user
  belongs_to :author
  belongs_to :publisher
  has_many :reviews, dependent: :destroy

  # validations
  validates :title, presence:true
  validates :genre, presence: true, inclusion: { in: (["Fiction", "Non-fiction", "Mystery", "Thriller", "Romance", "Sci-Fi", "Fantasy", "Historical Fiction", "Biography", "Autobiography", "Self-help", "Business""History", "Travel", "Poetry", "Drama", "Horror", "Comedy", "Children's", "Young Adult"])}
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :publish_date, presence: true
end
