class CreateLessors < ActiveRecord::Migration
  def change
    create_table :lessors do |t|
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
