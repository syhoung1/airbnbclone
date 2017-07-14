class AddCustomerIdToTenant < ActiveRecord::Migration
  def change
    change_table :tenants do |t|
      t.string :stripe_customer_id, limit: 50, null: true
    end
  end
end
