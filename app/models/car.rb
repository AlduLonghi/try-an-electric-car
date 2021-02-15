class Car < ApplicationRecord
  has_many :pictures, dependent: :destroy
end
