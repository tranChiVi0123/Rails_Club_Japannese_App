class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :level, null: false
      t.text :content, null: false
      t.text :answers, null: false
      t.string :key, null: false
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end

    add_index :questions, :level
  end
end
