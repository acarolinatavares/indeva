class Goal < ApplicationRecord
  belongs_to :store
  has_many :goal_date_employees
  has_many :employess, through: :goal_date_employees
end
