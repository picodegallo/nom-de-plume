class CreateOpeningLines < ActiveRecord::Migration
  def change
    create_table :opening_lines do |t|
      t.string :content

      t.timestamps
    end
  end
end
