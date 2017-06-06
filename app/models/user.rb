class User < ApplicationRecord
	has_many :posts
	before_create :create_remember_token
	before_save { self.email = email.downcase }
	validates :name,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                format: { with: VALID_EMAIL_REGEX },
	                uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(string)
	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                              BCrypt::Engine.cost
	BCrypt::Password.create(string, cost: cost)
	end

private
	
	def create_remember_token
		self.remember_token = User.digest(User.new_remember_token)
	end
end