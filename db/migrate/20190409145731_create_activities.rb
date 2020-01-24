class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.float :distance
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :type
      t.integer :difficulty_rating
      t.boolean :parking 
      t.timestamps
    end
  end
end
