class User < ActiveRecord::Base
	has_many :lessons

	before_save {self.email = email.downcase}
	before_save :encrypt_password, :create_role
	validates :fullname, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255},
					format: {with: VALID_EMAIL_REGEX},
					uniqueness: {case_sensitive: false}
	validates :password, presence: true, length: {:within => 5..40},
					confirmation: true
	def User.digest(string)
		Digest::SHA256.hexdigest(string)
	end

	def has_password?(submitted_password)
		encrypt_password == encrypt(submitted_password)
	end

	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

	def self.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
	end

	private
		def encrypt_password
			self.salt = make_salt if new_record?
			self.encrypted_password = encrypt(password)
		end

		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end

		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end

		def secure_hash(string)
			Digest::SHA256.hexdigest(string)
		end

		def create_role
			self.role = "User" if self.role == nil
		end
end
