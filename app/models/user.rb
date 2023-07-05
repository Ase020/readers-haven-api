class User < ApplicationRecord
  has_many :books
  has_many :reviews

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, presence: true, length: { minimum: 8, maximum: 12 }
  validates :image_url, presence: true
end
