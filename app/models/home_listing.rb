class HomeListing < ActiveRecord::Base
  belongs_to :lessor
  
  has_many :booking_requests
  has_one :address
end
