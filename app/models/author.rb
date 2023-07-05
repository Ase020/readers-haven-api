class Author < ApplicationRecord
  has_many :books
  has_many :publishers, through: :books

  # validations
  validates :name, presence: true
  validates :gender, presence: true
  validates :email,presence:true,  uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :nationality, presence: true
  validates :bio, presence: true
end

