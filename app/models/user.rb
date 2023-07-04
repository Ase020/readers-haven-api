class User < ApplicationRecord
  has_many :books
  has_many :reviews

  has_secure_password
end
