class TestPaper < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :exam
  belongs_to :test_session
end
