class Store < ApplicationRecord
  resourcify
  belongs_to :owner
  has_many :employees, inverse_of: :store
  has_many :goals
  accepts_nested_attributes_for :employees, reject_if: :all_blank, allow_destroy: true
  validates :employees, presence: true
  validates :name, presence: true
end
