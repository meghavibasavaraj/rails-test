class User < ActiveRecord::Base
	has_secure_password
	

	validates :first_name,:last_name,presence: true
	validates :email,presence: true,uniqueness: true
	
validates :password, :presence => true,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{8,})\z/, message: "Not valid" }
end
