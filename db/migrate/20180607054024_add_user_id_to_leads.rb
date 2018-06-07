class AddUserIdToLeads < ActiveRecord::Migration[5.1]
  def change
  	add_column :leads, :user_id, :interger
  end
end
