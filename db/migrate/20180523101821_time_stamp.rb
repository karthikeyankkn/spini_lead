class TimeStamp < ActiveRecord::Migration[5.1]
  def change
   	add_column :leads, :created_at, :datetime
   	add_column :leads, :updated_at, :datetime
  end
end
