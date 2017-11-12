class GoalDateEmployee < ApplicationRecord
  belongs_to :employee
  belongs_to :goal_date
end
