class AddLessorToHomeListing < ActiveRecord::Migration
  def change
    add_reference :home_listings, :lessor, index: true, foreign_key: true
  end
end
