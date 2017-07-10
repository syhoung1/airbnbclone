class Address < ActiveRecord::Base
  belongs_to :home_listing
  geocoded_by :address
  after_validation :geocode
end
