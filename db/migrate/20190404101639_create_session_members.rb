class CreateSessionMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :session_members do |t|
      t.references :test_session, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
