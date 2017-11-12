class Goal < ApplicationRecord
  resourcify
  belongs_to :store
  has_many :goal_date_employees
  has_many :employess, through: :goal_date_employees
end
