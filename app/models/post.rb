class Post < ActiveRecord::Base
	has_many :images
	has_many :comments, as: :commentable
	validates :title, :content, presence: true
end
