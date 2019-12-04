class CreateTestExams < ActiveRecord::Migration[5.2]
  def change
    create_table :test_exams do |t|
      t.references :test_session, foreign_key: true
      t.references :exam, foreign_key: true

      t.timestamps
    end
    add_index :test_exams, :test_session
    add_index :test_exams, :exam
  end
end
