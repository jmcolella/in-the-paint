class Team < ApplicationRecord
	has_many :articles
  has_many :users
  has_many :players
end
