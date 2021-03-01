class Picture < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :car
end
