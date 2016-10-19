class User < ActiveRecord::Base
	has_many :statuses, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_secure_password

	validates_presence_of :name
	validates_uniqueness_of :name
	

	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :email, uniqueness: true, presence: true
	
	# validates :password, 
	# 	presence: { on: :create }, 
	# 	length: { minimum: 6, maximum: 20 },
	# 	confirmation: true

	validates_length_of :password, minimum: 6
	validates_length_of :password, maximum: 20

	validates_confirmation_of :password
	validates_presence_of :password_confirmation, on: :create

end
