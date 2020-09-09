class CreateResets < ActiveRecord::Migration
  def change
    
    create_table :resets do |t|
      t.string :email
      t.string :status
      t.integer :user_id

      t.timestamps null: false
      
    end
  end
end
