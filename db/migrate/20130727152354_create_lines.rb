class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :user_id
      t.integer :story_id
      t.string :content
      t.string :phone_number
      t.timestamps
    end
  end
end
