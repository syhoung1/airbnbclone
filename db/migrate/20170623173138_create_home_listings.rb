class CreateHomeListings < ActiveRecord::Migration
  def change
    create_table :home_listings do |t|
      t.string :title
      t.integer :capacity
      t.float :bathrooms
      t.integer :bedrooms
      t.integer :beds
      t.time :checkin
      t.time :checkout
      t.text :rules
      t.integer :security_deposit
      t.integer :cleaning_fee
      t.integer :extra_person_fee
      t.text :amenities, array:true, default: []
      t.integer :min_stay

      t.timestamps null: false
    end
  end
end
