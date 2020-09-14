class ChangeIntegerLimitUsers < ActiveRecord::Migration
  def change
    change_column :users, :phone, :integer, limit: 12
  end
end
