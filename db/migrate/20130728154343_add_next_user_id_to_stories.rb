class AddNextUserIdToStories < ActiveRecord::Migration
  def change
  	add_column :stories, :next_user_id, :integer
  end
end
