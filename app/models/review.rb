class Review < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :home_listing
end
