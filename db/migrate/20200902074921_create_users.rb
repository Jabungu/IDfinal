class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :title
      t.string :email
      t.integer :phone
      t.text :POB
      t.integer :tier

      t.timestamps null: false
    end
  end
end
