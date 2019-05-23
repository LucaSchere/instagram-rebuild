class Photo < ApplicationRecord
  belongs_to :post

  mount_uploader :image, PhotoUploader
  validates :image, presence: true

end
