class Employee < ApplicationRecord
  resourcify
  belongs_to :store
  has_many :goal_date_employees
  has_many :goal_dates, through: :goal_date_employees
  validates :name, presence: true
  validates :rg, presence: true, uniqueness: true
end
