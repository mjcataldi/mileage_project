class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :reviewer_id, null:false
      t.integer :restaurant_id, null:false
      t.string :title, null:false
      t.string :body, null:false
      t.integer :rating, null:false

      t.timestamps
    end
  end
end
