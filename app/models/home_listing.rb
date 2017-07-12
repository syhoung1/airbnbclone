class HomeListing < ActiveRecord::Base
  belongs_to :lessor
  mount_uploader :photos, PhotoUploader
  
  has_many :booking_requests
  has_one :address
end
