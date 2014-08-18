class Photo < ActiveRecord::Base
  belongs_to :gadget

  validates :gadget, presence: true

  mount_uploader :image, PhotoUploader
end
