class AddAboutToHomeListing < ActiveRecord::Migration
  def change
    add_column :home_listings, :about, :text
  end
end
