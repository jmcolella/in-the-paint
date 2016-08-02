class Team < ApplicationRecord

  has_many :users
  has_many :players
  has_many :articles
end
