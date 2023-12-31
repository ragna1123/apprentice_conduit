class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum:255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
