class User < ApplicationRecord
  has_secure_password
  has_many :appointments, dependent: :destroy
end
