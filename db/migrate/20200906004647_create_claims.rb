class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.string :owner_name
      t.string :amount
      t.string :property_id
      t.string :property_type
      t.string :year_reported
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
