class User < ApplicationRecord

  belongs_to :team
	has_many :articles
  has_many :comments

	validates :username, :email, :password, presence: true
	validates :username, :email, uniqueness: true

	has_secure_password

end
