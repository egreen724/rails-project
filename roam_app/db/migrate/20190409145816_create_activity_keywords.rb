class CreateActivityKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_keywords do |t|
      t.integer :activity_id
      t.integer :keyword_id 
      t.timestamps
    end
  end
end
