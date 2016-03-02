class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates :title, presence: true ,uniqueness: true, length: {minimum: 5}
end
