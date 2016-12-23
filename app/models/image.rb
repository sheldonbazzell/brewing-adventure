class Image < ActiveRecord::Base
	belongs_to :post
	has_many :comments, as: :commentable
	has_attached_file :avatar
	validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
