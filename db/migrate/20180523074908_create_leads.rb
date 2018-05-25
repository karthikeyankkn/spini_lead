class CreateLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :leads do |t|
    	t.string :name
    	t.bigint :phoneno
    	t.string :email
    	t.string :category
    end
  end
end
