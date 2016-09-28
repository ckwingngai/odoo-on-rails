class Member < ApplicationRecord
  has_many :participates
  has_many :companies, through: :participates
end
