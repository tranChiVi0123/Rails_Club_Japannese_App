class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
      t.integer :role, null: false, :default => 1 #normal User, 2 admin
      t.string :name, limit: 128
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
