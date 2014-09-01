class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :body
      t.date :deadline
      t.integer :user_id, null: false

      t.timestamps
    end
    
    add_index :goals, :user_id
    add_index :goals, :title
  end
end
