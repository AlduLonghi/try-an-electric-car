class Picture < ApplicationRecord
  belongs_to :car
  include ImageUploader::Attachment(:image)
end
