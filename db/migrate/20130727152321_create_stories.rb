class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|

      t.timestamps
    end
  end
end
