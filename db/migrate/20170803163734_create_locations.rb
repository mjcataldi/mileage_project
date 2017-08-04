class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.integer :user_id, null:false
      t.string :origin, null:false
      t.string :destination, null:false
      t.decimal :distance, null:false

      t.timestamps
    end
  end
end
