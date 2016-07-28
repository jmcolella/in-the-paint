class Article < ApplicationRecord

	belongs_to :user
  has_many :comments
  has_many :votes, as: :voteable

	validates :title, :body, presence: true

end
