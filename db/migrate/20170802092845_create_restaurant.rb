class CreateRestaurant < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.integer :owner_id, null:false
      t.string :name
      t.string :cuisine
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
