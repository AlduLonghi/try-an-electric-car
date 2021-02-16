class User < ApplicationRecord
  has_secure_password
  has_many :appointments, dependent: :destroy
  validates :name, length: { minimum: 6 }
  validates :email, uniqueness: true
  validates :password, length: { minimum: 5 }
end
