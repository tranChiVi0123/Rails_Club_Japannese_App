class SessionMember < ApplicationRecord
  belongs_to :user
  belongs_to :test_session
end
