class Team < ApplicationRecord
  has_many :team_user
  has_many :users,through: :team_user
  validates :name, uniqueness: true
end
