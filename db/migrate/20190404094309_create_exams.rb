class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.string :title
      t.text :list_questions
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :exams, :test_session
  end
end
