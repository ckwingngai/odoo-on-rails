class Company < ApplicationRecord
  has_many :participates
  has_many :members, through: :participates
end
