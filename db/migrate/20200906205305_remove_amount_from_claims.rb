class RemoveAmountFromClaims < ActiveRecord::Migration
  def change
    remove_column :claims, :amount, :string
  end
end
