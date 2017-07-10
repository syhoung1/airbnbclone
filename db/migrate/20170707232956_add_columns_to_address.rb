class AddColumnsToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :city, :string
    add_column :addresses, :state, :string
    add_column :addresses, :country, :string
    add_column :addresses, :zip_code, :integer
  end
end
