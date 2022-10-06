class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, length: { minimum: 5, maximum: 15 }
  has_many :messages
end
