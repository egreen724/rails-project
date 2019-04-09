class CreateActivityKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_keywords do |t|

      t.timestamps
    end
  end
end
