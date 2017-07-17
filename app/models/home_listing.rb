class HomeListing < ActiveRecord::Base
  attr_accessor :photos
  belongs_to :lessor
  mount_uploader :photo, PhotoUploader
  serialize :photos, JSON
  
  has_many :reviews  
  has_many :booking_requests
  has_one :address
end
