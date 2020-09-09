class AddAmountToClaims < ActiveRecord::Migration
  def change
    add_column :claims, :amount, :integer
  end
end
