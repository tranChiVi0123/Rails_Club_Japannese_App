class Category < ApplicationRecord
    has_many :questions, dependent: :destroy
    has_many :classses, dependent: :destroy
    has_many :exams, dependent: :destroy
    has_many :test_sessions, dependent: :destroy
    has_many :test_papers, dependent: :destroy
    has_many :posts, dependent: :destroy 
end
