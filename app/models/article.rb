class Article < ApplicationRecord

	belongs_to :user
	belongs_to :team
  has_many :comments
  has_many :votes, as: :voteable

	validates :title, :body, presence: true

end
