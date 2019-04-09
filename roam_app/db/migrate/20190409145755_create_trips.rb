class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.integer :activity_id
      t.string :comment
      t.date :date
      t.integer :time_ellapsed 
      t.boolean :taken
      t.timestamps
    end
  end
end
