class User < ApplicationRecord
  has_many :events, dependent: :destroy
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    length: {maximum: 105},
                    format: {with: VALID_EMAIL}
  validates :username, presence: true,
                    uniqueness: true,
                    length: {maximum: 20},
  before_save {self.email = self.email.downcase}
  has_secure_password
end
