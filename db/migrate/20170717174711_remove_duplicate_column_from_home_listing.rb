class RemoveDuplicateColumnFromHomeListing < ActiveRecord::Migration
  def change
    remove_column :home_listings, :photo
  end
end
