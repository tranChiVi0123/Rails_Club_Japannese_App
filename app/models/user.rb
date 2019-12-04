class User < ApplicationRecord
  include Clearance::User
  has_many :reviews, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :classses, dependent: :destroy
  has_many :class_members, dependent: :destroy
  has_many :exams, dependent: :destroy
  has_many :test_sessions, dependent: :destroy
  has_many :test_papers, dependent: :destroy
  has_many :session_members, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
