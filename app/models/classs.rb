class Classs < ApplicationRecord
    has_many :class_members, dependent: :destroy
end
