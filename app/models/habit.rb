class Habit < ApplicationRecord
  has_many :records, dependent: :destroy
end
