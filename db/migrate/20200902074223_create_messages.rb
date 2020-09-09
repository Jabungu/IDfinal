class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :company
      t.string :title
      t.string :email
      t.integer :phone
      t.text :message

      t.timestamps null: false
    end
  end
end
