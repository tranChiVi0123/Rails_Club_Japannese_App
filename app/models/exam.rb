class Exam < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :test_papers, dependent: :destroy
    has_many :test_exams, dependent: :destroy
    has_many :test_sessions, through: :test_exams
end
