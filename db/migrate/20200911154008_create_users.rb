class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip
      t.string :title
      t.string :email
      t.string :password_digest
      t.string :subsidiaries
      t.text :POB
      t.integer :phone

      t.timestamps null: false
    end
  end
end
