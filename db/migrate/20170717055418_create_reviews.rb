class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :tenant, index: true, foreign_key: true
      t.references :home_listing, index: true, foreign_key: true
      t.text :review

      t.timestamps null: false
    end
  end
end
