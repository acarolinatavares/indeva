class Store < ApplicationRecord
  resourcify
  belongs_to :owner
  has_many :employees
end
