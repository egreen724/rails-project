class AddCreatorToActivity < ActiveRecord::Migration[5.2]
  def change
    add_reference :activities, :creator, references: :users, index: true
    add_foreign_key :activities, :users, column: :creator_id
  end
end
