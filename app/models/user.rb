class User < ActiveRecord::Base
	has_many :statuses, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_secure_password

	validates :name, uniqueness: true, presence: true
	
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :email, uniqueness: true, presence: true
	
	# validates :password, 
	# 	presence: { on: :create }, 
	# 	length: { minimum: 6, maximum: 20 },
	# 	confirmation: true
	validates :password,  
		length: { minimum: 6, maximum: 20 },
		confirmation: true
	validates :password_confirmation, presence: true, on: :create

end
