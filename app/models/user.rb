class User < ActiveRecord::Base
	has_secure_password
	email_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :first_name, :last_name, :email, presence: :true
	validates :email, format: { with: email_regex }

end
