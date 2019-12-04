class CreateClassses < ActiveRecord::Migration[5.2]
  def change
    create_table :classses do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :classses, :name
  end
end
