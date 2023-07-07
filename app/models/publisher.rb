class Publisher < ApplicationRecord
  has_many :books
  has_many :authors, through: :books

  # Validations
  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true
end