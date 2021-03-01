class Car < ApplicationRecord
  has_many :pictures, dependent: :destroy
  has_many :appointments, dependent: :destroy
end
