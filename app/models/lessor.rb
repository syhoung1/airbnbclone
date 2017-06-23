class Lessor < ActiveRecord::Base
  belongs_to :user
  has_one :home_listing
end
