class CreateDistances < ActiveRecord::Migration[5.1]
  def change
    create_table :distances do |t|
      t.integer :user_id
      t.string :origin, null:false
      t.string :destination, null:false
      t.decimal :distance, precision: 5, scale: 1

      t.timestamps
    end
  end
end
