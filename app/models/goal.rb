class Goal < ApplicationRecord
  resourcify
  belongs_to :store
  has_many :goal_dates

  validates :init_date, :end_date, :value, :store_id, presence: true
end
