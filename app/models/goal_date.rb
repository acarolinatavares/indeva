class GoalDate < ApplicationRecord
  belongs_to :goal
  has_many :goal_date_employees
  has_many :employess, through: :goal_date_employees
end
