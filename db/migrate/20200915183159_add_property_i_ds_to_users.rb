class AddPropertyIDsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :property_id, :integer, array:true, default: []
  end
end
