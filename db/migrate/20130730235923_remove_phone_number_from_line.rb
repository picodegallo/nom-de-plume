class RemovePhoneNumberFromLine < ActiveRecord::Migration
  def change
    remove_column :lines, :phone_number
  end
end
