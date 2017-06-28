class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :home_listing, index: true, foreign_key: true
      t.float :longitude
      t.float :latitude
      t.string :address

      t.timestamps null: false
    end
  end
end
