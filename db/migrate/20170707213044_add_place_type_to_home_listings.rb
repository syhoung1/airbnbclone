class AddPlaceTypeToHomeListings < ActiveRecord::Migration
  def change
    add_column :home_listings, :place_type, :string
    add_column :home_listings, :party_size, :integer
    add_column :home_listings, :place, :string
    add_column :home_listings, :property_type, :string
    add_column :home_listings, :accommodation_situation, :string
    add_column :home_listings, :shared_spaces, :text, array:true, default: []
    add_column :home_listings, :summary, :text
    add_column :home_listings, :good_for, :string
    add_column :home_listings, :price, :integer
  end
end
