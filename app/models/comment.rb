class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :article
  has_many :votes, as: :voteable

  validates :body, presence: true

end
