class HomeListing < ActiveRecord::Base
  belongs_to :lessor
  
  has_one :address
end
