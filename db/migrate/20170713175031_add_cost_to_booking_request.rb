class AddCostToBookingRequest < ActiveRecord::Migration
  def change
    add_column :booking_requests, :cost, :integer
  end
end
