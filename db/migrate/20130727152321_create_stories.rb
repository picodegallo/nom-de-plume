class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.datetime :ended_at
      t.timestamps
    end
  end
end
