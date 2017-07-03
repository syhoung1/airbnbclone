class BookingRequest < ActiveRecord::Base
  belongs_to :home_listing
  belongs_to :tenant
end
