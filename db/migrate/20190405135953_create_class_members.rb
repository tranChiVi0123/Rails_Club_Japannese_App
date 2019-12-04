class CreateClassMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :class_members do |t|
      t.references :user, foreign_key: true
      t.references :classs, foreign_key: true

      t.timestamps
    end
  end
end
