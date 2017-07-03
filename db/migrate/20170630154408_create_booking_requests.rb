class CreateBookingRequests < ActiveRecord::Migration
  def change
    create_table :booking_requests do |t|
      t.belongs_to :home_listing, index: true, foreign_key: true
      t.belongs_to :tenant, index: true, foreign_key: true
      t.date :checkin, null: false
      t.date :checkout, null: false
      t.integer :party_size
      t.boolean :pending, default: true

      t.timestamps null: false
    end
  end
end
