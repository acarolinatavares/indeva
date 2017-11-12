class Store < ApplicationRecord
  belongs_to :owner
  has_many :employees
end
