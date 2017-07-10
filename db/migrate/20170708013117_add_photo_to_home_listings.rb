class AddPhotoToHomeListings < ActiveRecord::Migration
  def change
    add_column :home_listings, :photos, :string
  end
end
