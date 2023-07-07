class Book < ApplicationRecord
  belongs_to :user
  belongs_to :author
  belongs_to :publisher
  has_many :reviews

  # validations
  validates :title, presence:true
  validates :genre, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :publish_date, presence: true
end