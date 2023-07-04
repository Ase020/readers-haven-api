class Book < ApplicationRecord
  belongs_to :user
  belongs_to :author
  belongs_to :publisher
  has_many :reviews
end
