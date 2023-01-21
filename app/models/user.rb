class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, :first_name, :last_name, presence: true
  validates :password, :password_confirmation, length: { minimum: 8 }
end
