class Tenant < ActiveRecord::Base
  belongs_to :user
  has_many :booking_requests
  has_many :reviews
end
