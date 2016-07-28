class User < ApplicationRecord

	has_many :articles

	validates :username, :email, :password, presence: true
	validates :username, :email, uniqueness: true

	has_secure_password

end
