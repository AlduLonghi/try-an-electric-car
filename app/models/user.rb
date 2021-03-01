class User < ApplicationRecord
  has_secure_password
  has_many :appointments, dependent: :destroy
  validates :name, length: { minimum: 6 }
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, length: { minimum: 5 }
end
